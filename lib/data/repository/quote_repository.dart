import 'package:hive_flutter/hive_flutter.dart';

import '../../network/api_client.dart';
import '../../utils/constants.dart';
import '../model/quote.dart';
import '../model/quote_response.dart';


class QuoteRepository {
  final ApiClient _apiClient = ApiClient();

  /// Fetch random quote from API.
  Future<QuoteResponse> getRandomQuote() async {
    return await _apiClient.getRandomQuote();
  }

  /// Get all saved Quotes from local database.
  Future<List<Quote>?> getSavedQuotes() async {
    Box quotesDb = await Hive.openBox(Constants.quoteBoxKey);

    return quotesDb.values.isNotEmpty
        ? quotesDb.values.toList().cast<Quote>()
        : null;
  }

  /// Save Quote in local database.
  Future<void> saveQuote(Quote? quote) async {
    Box quotesDb = await Hive.openBox(Constants.quoteBoxKey);
    quotesDb.add(quote);
  }

  /// Remove Quote from local database.
  Future<void> removeQuote(Quote? quote) async {
    if (quote != null) {
      quote.delete();
    }
  }

  /// Remove All Quotes from local database.
  Future<void> removeAllQuotes() async {
    Box quotesDb = await Hive.openBox(Constants.quoteBoxKey);
    quotesDb.clear();
  }
}
