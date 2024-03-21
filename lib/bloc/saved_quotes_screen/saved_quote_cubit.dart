import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

import '../../data/model/quote.dart';
import '../../data/repository/quote_repository.dart';
import '../../network/location_service.dart';
part 'saved_quote_state.dart';

/// [SavedQuotesCubit] handles loading and deleting quotes in [SavedQuotesScreen]
/// Only fetches quotes from the local database
class SavedQuotesCubit extends Cubit<SavedQuoteState> {
  QuoteRepository quoteRepository;
  late LocationService locationService;

  SavedQuotesCubit({required this.quoteRepository}) : super(SavedQuoteInit());

  /// [getAllSavedQuotes] Loads all quotes from DB.
  void getAllSavedQuotes() async {

    emit(LoadingSavedQuotes());

    // Get Quote Response.
    final savedQuotes = await quoteRepository.getSavedQuotes();

    // Check if DB has any quotes stored.
    if (savedQuotes != null && savedQuotes.isNotEmpty) {
      emit(SavedQuotesLoaded(savedQuotes));
    } else {
      locationService=LocationService();
      final position=await locationService.determinePosition();
      emit(NoSavedQuotes(position));
    }
  }

  /// Delete all quotes.
  void deleteAllSavedQuotes() async {
    locationService=LocationService();
    final position=await locationService.determinePosition();
    await quoteRepository.removeAllQuotes();
    emit(NoSavedQuotes(position));
  }
}
