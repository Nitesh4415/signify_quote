import 'package:flutter/material.dart';
import 'package:signify_app/ui/saved_quotes/widgets/share_quote_button.dart';

import '../../../data/model/quote.dart';


/// [CardWidget] displays all the saved quote in a list inside card view.
class CardWidget extends StatelessWidget {
  const CardWidget({
    required this.content,
    required this.author,
    required this.quote,
    Key? key,
  }) : super(key: key);

  final String content;
  final String author;
  final Quote quote;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      elevation: 8.0,
      margin: const EdgeInsets.all(4.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child:Container(
        margin: const EdgeInsets.all(6.0),
        child: Column(
        children: [
          Text(
            content,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            textAlign:TextAlign.right,
            author,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w700,
            ),
          ),
           SizedBox(child: ShareQuoteButton(
            quote: quote,
          ),)
        ],
      ),
      ),
    );

  }

}