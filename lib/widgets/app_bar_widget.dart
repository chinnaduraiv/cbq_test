import 'package:cbq/features/setting/language/appLocalizations.dart';
import 'package:cbq/widgets/toggle_button_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget>? actions;
  final Function()? callBack;

  const AppBarWidget(
      {super.key, required this.title, this.actions, this.callBack});

  static const double appBarHeight = 56.0;

  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      leading: IconButton(
          onPressed: callBack!,
          icon: const Icon(Icons.supervised_user_circle_sharp, size: 44)),
      // title: title,
      title: Row(children: [
        title,
      ]),
      elevation: 0,
      toolbarHeight: appBarHeight,
      actions: [
        ToggleButton(
          callBack: (_) {},
          buttonNameList: [
            AppLocalizations.of(context).getTranslate('dark'),
            AppLocalizations.of(context).getTranslate('light')
          ],
        ),
      ],
    );
  }
}
