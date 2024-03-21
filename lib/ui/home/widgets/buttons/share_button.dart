import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/home_screen/home_cubit.dart';
import '../../../../theme/app_dimens.dart';
import '../../../../utils/share_util.dart';


class ShareButton extends StatelessWidget {
  const ShareButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (BuildContext context, state) {
        return IconButton(
          onPressed: () {
            if (state is HomeLoaded) {
              ShareUtil.shareQuote(state.randomQuote);
            }
          },
          icon: const Icon(
            Icons.share,
            size: AppDimens.iconSizeM,
            color: Colors.white,
          ),
        );
      },
    );
  }
}
