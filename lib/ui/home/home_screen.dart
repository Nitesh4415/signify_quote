import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signify_app/ui/home/widgets/about_panel.dart';
import 'package:signify_app/ui/home/widgets/home_content.dart';
import 'package:signify_app/ui/home/widgets/home_footer.dart';
import 'package:signify_app/ui/home/widgets/home_header.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../bloc/home_screen/home_cubit.dart';
import '../../theme/app_dimens.dart';
import '../saved_quotes/saved_quotes_screen.dart';


/// [HomeScreen] is the main screen of the app, containing most of the content.
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final PanelController panelController = PanelController();

  @override
  void initState() {
    super.initState();
    panelController.isAttached ? panelController.hide() : null;
    BlocProvider.of<HomeCubit>(context).getRandomQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        controller: panelController,
        maxHeight: MediaQuery.of(context).size.height *
            AppDimens.panelHeightPercentage,
        minHeight: 0,
        backdropEnabled: true,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(
            AppDimens.borderRadiusXL,
          ),
        ),
          panelBuilder: (ScrollController sc) => AboutPanel(scrollController: sc),
        body: SafeArea(
          child: Column(
            children: [
              HomeHeader(panelController: panelController),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (BuildContext context, state) {
                  return state is HomeNoNetwork
                      ? const SavedQuotesScreen()
                      : const Expanded(
                          child: Column(
                            children: [
                              HomeContent(),
                              HomeFooter(),
                            ],
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
