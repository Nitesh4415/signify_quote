import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/initialization/initialization_cubit.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/ui_strings.dart';



/// Widget that shows if there is no internet connectivity on app startup.
class SplashNoNetworkView extends StatelessWidget {
  const SplashNoNetworkView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              UiStrings.noNetworkMessage,
              style: Theme.of(context).primaryTextTheme.bodyMedium,
            ),
            ElevatedButton(
              onPressed: () =>
                  BlocProvider.of<InitializationCubit>(context).reloadStartup(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mediumAquamarine,
                textStyle: Theme.of(context).primaryTextTheme.bodyMedium,
              ),
              child: const Text(UiStrings.reloadButtonTitle),
            ),
          ],
        ),
      ),
    );
  }
}
