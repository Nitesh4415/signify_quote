import 'package:flutter/material.dart';

import '../../../../data/model/quote.dart';
import '../../../../theme/app_dimens.dart';


/// Widget that displays the text from [Quote].
class TextContainer extends StatefulWidget {
  final Quote randomQuote;

  const TextContainer({
    Key? key,
    required this.randomQuote,
  }) : super(key: key);

  @override
  TextContainerState createState() => TextContainerState();
}

class TextContainerState extends State<TextContainer> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(
        right: AppDimens.paddingXL,
        left: AppDimens.paddingXL,
        top: (MediaQuery.of(context).size.height) *
            AppDimens.paddingPercentageS,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.randomQuote.content,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            )
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height) *
                AppDimens.sizeUnitPercentageM,
          ),
          Text(
            "- ${widget.randomQuote.author}",
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
