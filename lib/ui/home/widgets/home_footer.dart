import 'package:flutter/material.dart';


import '../../../theme/app_dimens.dart';
import 'buttons/bookmark_button.dart';
import 'buttons/quote_button.dart';
import 'buttons/share_button.dart';

/// [HomeFooter] footer of the home-screen containing the quote-function buttons.
class HomeFooter extends StatelessWidget {
  const HomeFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: (MediaQuery.of(context).size.height) *
              AppDimens.paddingPercentageXS,
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BookmarkButton(),
            QuotesButton(),
            ShareButton(),
          ],
        ),
      ),
    );
  }
}
