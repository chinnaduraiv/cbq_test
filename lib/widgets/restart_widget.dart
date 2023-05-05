import 'package:flutter/cupertino.dart';

class RestartApp extends StatefulWidget {
  const RestartApp({super.key, this.child});

  final Widget? child;

  static void restartTheApp(BuildContext context) {
    context.findAncestorStateOfType<RestartWidgetState>()?.restartApp();
  }

  @override
  State<StatefulWidget> createState() {
    return RestartWidgetState();
  }
}

class RestartWidgetState extends State<RestartApp> {
  Key uniqueKey = UniqueKey();

  void restartApp() {
    setState(() {
      uniqueKey = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: uniqueKey,
      child: widget.child ?? Container(),
    );
  }
}
