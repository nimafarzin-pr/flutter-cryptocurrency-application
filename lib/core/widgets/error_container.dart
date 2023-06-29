import 'package:flutter/material.dart';

import 'text_widget.dart';

class ErrorContainer extends StatelessWidget {
  const ErrorContainer({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [CustomText(text: text)],
      ),
    );
  }
}
