import 'dart:convert';

import '../data/model/quote.dart';
import '../data/model/quote_response.dart';
import 'package:http/http.dart' as http;



/// [ApiClient] handles all API requests.
class ApiClient {

  Future<QuoteResponse> getRandomQuote() async {
    try {
      var url = Uri.parse("http://api.quotable.io/random");
      final response = await http.get(url, headers: {"Content-Type": "application/json"});
      final randomQuote = Quote.fromJson(jsonDecode(response.body) as Map<String, dynamic>);

      return SuccessResponse(randomQuote);
    } on Exception catch (e) {
          return ErrorResponse("Error:$e");
    }
  }
}
