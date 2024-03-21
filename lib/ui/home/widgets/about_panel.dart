import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:signify_app/ui/home/widgets/panel_widgets/panel_divider.dart';
import 'package:signify_app/ui/home/widgets/panel_widgets/panel_header.dart';
import 'package:signify_app/ui/home/widgets/panel_widgets/panel_list_tile.dart';

import '../../../theme/app_dimens.dart';
import '../../../utils/constants.dart';
import '../../../utils/rating_dialog_widget.dart';
import '../../../utils/ui_strings.dart';


/// [AboutPanel] displays information about the app and extra communication.
class AboutPanel extends StatefulWidget {
  final ScrollController? scrollController;

  const AboutPanel({
    this.scrollController,
    Key? key,
  }) : super(key: key);

  @override
  State<AboutPanel> createState() => _AboutPanelState();
}

class _AboutPanelState extends State<AboutPanel> {
  PackageInfo? appInfo;

  Future<PackageInfo> initPackageInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();

    return packageInfo;
  }

  @override
  Widget build(BuildContext context) {
    initPackageInfo().then((packageInfo) {
      setState(() {
        appInfo = packageInfo;
      });
    });

    return SingleChildScrollView(
      controller: widget.scrollController,
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
        ),
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              const PanelHeader(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          top: AppDimens.paddingL,
                          bottom: AppDimens.paddingM,
                        ),
                        child: CircleAvatar(
                          radius: 70,
                          foregroundImage: AssetImage(
                            Constants.appIcon,
                          ),
                        ),
                      ),
                      Text(
                        UiStrings.appName,
                        style: Theme.of(context).primaryTextTheme.bodyMedium,
                      ),
                      Text(
                        'v${appInfo?.version}',
                        style: Theme.of(context).primaryTextTheme.bodyMedium,
                      ),
                      const SizedBox(height: AppDimens.sizeUnitM),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const PanelDivider(),
                      PanelListTile(
                        title: UiStrings.rateTheApp,
                        tileIcon: const Icon(Icons.rate_review_outlined),
                        onTap: () async {
                             await showDialog(
                                context: context,
                                builder: (_) => const RatingDialog()
                            );

                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
