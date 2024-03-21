import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/home_screen/home_cubit.dart';
import '../../../../bloc/home_screen/quote_button/quote_button_cubit.dart';
import '../../../../bloc/network_connectivity/network_connectivity_cubit.dart';
import '../../../../theme/app_dimens.dart';
import '../../../../utils/ui_strings.dart';


/// [QuoteButton] executes request to fetch new random quote.
/// Also, it animates whenever it is pressed.
class QuotesButton extends StatefulWidget {
  const QuotesButton({Key? key}) : super(key: key);

  @override
  QuotesButtonState createState() => QuotesButtonState();
}

class QuotesButtonState extends State<QuotesButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuoteButtonCubit, QuoteButtonState>(
      listener: (BuildContext context, state) {
        if (state is QuoteButtonPressed) {
          // Execute the icon rotation.
          _controller.reset();
          _controller.forward();
        }
      },
      child: BlocBuilder<NetworkConnectivityCubit, NetworkConnectivityState>(
        builder: (BuildContext context, state) {
          return ElevatedButton(
            onPressed: () {
              // Based on the network connection, do request to fetch quotes.
              if (state is NoNetworkConnectionState) {
                Navigator.pushReplacementNamed(
                  context,
                  UiStrings.homeNoNetworkWidgetRoute,
                );
              } else {
                BlocProvider.of<HomeCubit>(context).getRandomQuote();
              }
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(
                AppDimens.buttonSizeXL,
                AppDimens.buttonSizeXL,
              ),
              backgroundColor: Theme.of(context).primaryColor,
              shape: const CircleBorder(
                side: BorderSide.none,
              ),
            ),
            child: Center(
              child: RotationTransition(
                turns: Tween(
                  begin: AppDimens.beginTween,
                  end: AppDimens.endTween,
                ).animate(_controller),
                child: const Icon(
                  Icons.sync,
                  size: AppDimens.iconSizeXL,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
