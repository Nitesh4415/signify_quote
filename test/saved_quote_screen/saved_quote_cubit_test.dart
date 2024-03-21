import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mocktail/mocktail.dart';
import 'package:signify_app/bloc/saved_quotes_screen/saved_quote_cubit.dart';
import 'package:signify_app/data/model/quote.dart';
import 'package:signify_app/data/repository/quote_repository.dart';

import '../mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late SavedQuotesCubit savedQuotesCubit;
  late QuoteRepository quoteRepository;
  final position=Position(longitude: 0.435, latitude: 77.432, timestamp:DateTime.now(), accuracy: 2.0, altitude: 38.76, altitudeAccuracy: 38.0, heading: 32.0, headingAccuracy: 32.067, speed: 84.07, speedAccuracy: 98.97);
  List<Quote> testQuoteList = [
  Quote(
    author: "Nitin Sinha",
    id: "123",
    content: "You are a winner until you give up",
    dateAdded: "21-03-2024",
  ),
  Quote(
  author: "Nitesh Sinha",
  id: "126",
  content: "Once you appreciate mistake , it will become a crime",
  dateAdded: "21-03-2024",
  )
  ];

  setUp(() {
    quoteRepository = MockQuoteRepository();
    savedQuotesCubit = SavedQuotesCubit(quoteRepository: quoteRepository);
  });

  group('SavedQuoteCubit', () {
    blocTest(
      'calls savedQuotesCubit.getAllSavedQuotes and emits [SavedQuotesLoaded] when there are saved quotes available',
      build: () => savedQuotesCubit,
      act: (SavedQuotesCubit cubit) {
        when(() => quoteRepository.getSavedQuotes()).thenAnswer(
          (_) => Future.value(testQuoteList),
        );

        cubit.getAllSavedQuotes();
      },
      expect: () => [LoadingSavedQuotes(), SavedQuotesLoaded(testQuoteList)],
    );
  });
}
