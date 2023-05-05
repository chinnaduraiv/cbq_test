import 'package:flutter/material.dart';
import 'package:cbq/widgets/text_widget.dart';

class ErrorText extends StatelessWidget {
  final String error;

  const ErrorText({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextUtils(
        text: 'Error $error',
        style: const TextStyle(
          fontSize: 20.0,
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
