import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/saved_quotes_screen/saved_quote_cubit.dart';
import '../../../data/model/quote.dart';
import '../../../theme/app_dimens.dart';
import '../../../utils/share_util.dart';


/// [ShareQuoteButton] shares saved quotes to other social-media when pressed.
class ShareQuoteButton extends StatelessWidget {
  final Quote quote;

  const ShareQuoteButton({
    required this.quote,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedQuotesCubit, SavedQuoteState>(
      builder: (BuildContext context, state) {
        return state is SavedQuotesLoaded
            ? IconButton(
                onPressed: () => ShareUtil.shareQuote(quote),
                icon: Icon(
                  Icons.share,
                  size: AppDimens.iconSizeM,
                  color: Theme.of(context).iconTheme.color,
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
