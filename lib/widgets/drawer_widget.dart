import 'package:cbq/dependency_injector/dependency_injector.dart';
import 'package:cbq/features/setting/language/appLocalizations.dart';
import 'package:cbq/widgets/restart_widget.dart';
import 'package:cbq/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrawerMenu extends ConsumerWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(children: <Widget>[
        const SizedBox(
          height: 30,
        ),
        ListTile(
          leading: const Icon(Icons.mode),
          title: TextUtils(
              text:
                  '${AppLocalizations.of(context).getTranslate('change')} ${ref.watch(settingNotifierProvider) ? AppLocalizations.of(context).getTranslate('light') : AppLocalizations.of(context).getTranslate('dark')} ${AppLocalizations.of(context).getTranslate('mode')}'),
          onTap: () {
            ref
                .read(settingNotifierProvider.notifier)
                .changeTheme(ref.watch(settingNotifierProvider) ? false : true);
          },
        ),
        ListTile(
          leading: const Icon(Icons.language),
          title: TextUtils(
              text:
                  '${AppLocalizations.of(context).getTranslate('language')} -> ${ref.watch(languageNotifierProvider) ? AppLocalizations.of(context).getTranslate('english') : AppLocalizations.of(context).getTranslate('arabic')} ${!ref.watch(languageNotifierProvider) ? '' : '(Language)'}'),
          onTap: () {
            ref
                .read(languageNotifierProvider.notifier)
                .changeLanguage(
                    ref.watch(languageNotifierProvider) ? false : true)
                .then((value) {
              RestartApp.restartTheApp(context);
            });
          },
        ),
      ]),
    );
  }
}
