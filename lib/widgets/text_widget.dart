// Flutter imports:
import 'package:flutter/material.dart';

class TextUtils extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const TextUtils({
    super.key,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? const TextStyle(fontFamily: 'Mulish'),
    );
  }
}
