import 'package:flutter/material.dart';
import 'package:signify_app/ui/saved_quotes/widgets/card_widget.dart';
import '../../../data/model/quote.dart';
import '../../../utils/ui_strings.dart';


class SavedQuotesList extends StatelessWidget {
  const SavedQuotesList({
    required this.savedQuotes,
    Key? key,
  }) : super(key: key);

  final List<Quote> savedQuotes;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: savedQuotes.length,
      separatorBuilder: (BuildContext context, int index) =>
          const Divider(height: 1),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: (){
            Navigator.pushReplacementNamed(
              context,
              UiStrings.sliderScreenRoute,
            );
          },
          child: CardWidget(content: savedQuotes[index].content,
              author: savedQuotes[index].author,
              quote:savedQuotes[index]),
        );
      },
    );
  }
}
