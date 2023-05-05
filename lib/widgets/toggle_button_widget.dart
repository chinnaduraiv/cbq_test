import 'package:cbq/dependency_injector/dependency_injector.dart';
import 'package:cbq/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToggleButton extends ConsumerWidget {
  final Function(int) callBack;
  final List<String> buttonNameList;

  const ToggleButton(
      {super.key, required this.callBack, required this.buttonNameList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingNotifierProvider);
    //false light mode
    List<bool> isSelectedList =
        List.generate(buttonNameList.length, (i) => false);
    if (state) {
      isSelectedList[0] = true;
    } else {
      isSelectedList[1] = true;
    }
    return ToggleButtons(
      direction: Axis.horizontal,
      onPressed: (int index) {
        callBack(index);
        ref
            .read(settingNotifierProvider.notifier)
            .changeTheme(index == 0 ? true : false);
      },
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      selectedColor: state ? Colors.black : Colors.white,
      fillColor: state ? Colors.white : Colors.black,
      // color: Colors.red[400],
      constraints: const BoxConstraints(
        minHeight: 30.0,
        minWidth: 70.0,
      ),
      isSelected: isSelectedList,
      children: buttonNameList
          .map(
            (names) => TextUtils(text: names),
          )
          .toList(),
    );
  }
}
