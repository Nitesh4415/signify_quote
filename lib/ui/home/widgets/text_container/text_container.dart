import 'package:flutter/material.dart';
import 'package:signify_app/theme/app_text_styles.dart';

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
            style: AppTextStyles.quoteText
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height) *
                AppDimens.sizeUnitPercentageM,
          ),
          Text(
            "- ${widget.randomQuote.author}",
            textAlign: TextAlign.right,
            style: AppTextStyles.quoteAuthor
          ),
        ],
      ),
    );
  }
}
