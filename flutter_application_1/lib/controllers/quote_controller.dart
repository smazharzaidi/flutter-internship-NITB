import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/quote_model.dart';

class QuoteController extends GetxController {
  var isLoading = false.obs;
  var error = ''.obs;
  var quotes = <Quote>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchQuotes();
  }

  Future<void> fetchQuotes() async {
    isLoading.value = true;

    try {
      final response =
          await http.get(Uri.parse('https://raw.githubusercontent.com/smazharzaidi/quote-api/main/db.json'));
      if (response.statusCode == 200) {
        final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;
        final quoteList = jsonBody['quotes'] as List<dynamic>;
        quotes.assignAll(
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
    quotes.add(quote);
  }
}
