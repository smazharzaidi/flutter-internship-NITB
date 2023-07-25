import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/quote_controller.dart';
import '../models/quote_model.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quoteController = Get.put(QuoteController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quotes',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(
          () {
            if (quoteController.isLoading.value) {
              return const CircularProgressIndicator();
            } else if (quoteController.error.value.isNotEmpty) {
              return Text(
                'Error: ${quoteController.error.value}',
                style: const TextStyle(fontSize: 18),
              );
            } else if (quoteController.quotes.isNotEmpty) {
              return ListView.builder(
                itemCount: quoteController.quotes.length,
                itemBuilder: (context, index) {
                  final quote = quoteController.quotes[index];
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => QuoteDialog(quote: quote),
                      );
                    },
                    child: QuoteItem(quote: quote),
                  );
                },
              );
            } else {
              return const Text(
                'No data',
                style: TextStyle(fontSize: 18),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AddQuoteDialog(quoteController: quoteController),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class QuoteItem extends StatelessWidget {
  final Quote quote;

  const QuoteItem({
    Key? key,
    required this.quote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            quote.quote,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            '- ${quote.author}',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class QuoteDialog extends StatelessWidget {
  final Quote quote;

  const QuoteDialog({Key? key, required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              quote.quote,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              '- ${quote.author}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class AddQuoteDialog extends StatelessWidget {
  final QuoteController quoteController;

  AddQuoteDialog({Key? key, required this.quoteController}) : super(key: key);

  final TextEditingController quoteTextController = TextEditingController();
  final TextEditingController authorTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: quoteTextController,
              decoration: const InputDecoration(
                labelText: 'Quote',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: authorTextController,
              decoration: const InputDecoration(
                labelText: 'Author',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final String quoteText = quoteTextController.text;
                final String authorText = authorTextController.text;

                if (quoteText.isNotEmpty && authorText.isNotEmpty) {
                  final Quote newQuote = Quote(
                    id: quoteController.quotes.length + 1,
                    quote: quoteText,
                    author: authorText,
                  );
                  quoteController.addQuote(newQuote);
                  Navigator.pop(context);
                } else {
                  // Show an error message if any of the fields are empty
                  Get.snackbar(
                      'Error', 'Please enter both a quote and an author.',
                      snackPosition: SnackPosition.BOTTOM);
                }
              },
              child: const Text('Add Quote'),
            ),
          ],
        ),
      ),
    );
  }
}
