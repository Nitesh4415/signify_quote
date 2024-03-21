import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:signify_app/bloc/saved_quotes_screen/saved_quote_cubit.dart';
import 'package:signify_app/data/model/quote.dart';
import 'package:signify_app/data/repository/quote_repository.dart';

import '../mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late SavedQuotesCubit savedQuotesCubit;
  late QuoteRepository quoteRepository;
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
