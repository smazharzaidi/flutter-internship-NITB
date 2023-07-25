import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_application_3/app/data/models/quote_model.dart';

class QuoteController extends GetxController {
  var isLoading = RxBool(false);
  RxString error = "".obs;
  var quotes = RxList<Quote>([]).obs;

  @override
  void onInit() {
    super.onInit();
    fetchQuotes(); 
  }

  Future<void> fetchQuotes() async {
    isLoading.value = true;

    try {
      final response = await http.get(Uri.parse(
          'https://raw.githubusercontent.com/smazharzaidi/quote-api/main/db.json'));
      if (response.statusCode == 200) {
        final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;
        final quoteList = jsonBody['quotes'] as List<dynamic>;
        quotes.value.assignAll(
            quoteList.map((quoteJson) => Quote.fromJson(quoteJson)).toList());
        error.value = '';
      } else {
        error.value = 'Failed to load quotes';
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void addQuote(Quote quote) {
    quotes.value.add(quote);
    postQuote(quote);
  }

  Future<void> postQuote(Quote quote) async {
    final String url =
        "https://my-json-server.typicode.com/smazharzaidi/quote-api/quotes";

    final headers = {
      'Content-Type': 'application/json',
    };

    final body = jsonEncode(quote.toJson());

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 201) {
        print('Quote posted successfully!');
      } else {
        print('Failed to post the quote. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
