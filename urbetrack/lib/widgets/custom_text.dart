import 'package:flutter/material.dart';
class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.fontSize = 12,
    this.weight = FontWeight.normal,
  }) : super(key: key);
  final double fontSize;
  final String text;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: fontSize,
      fontWeight: weight,
    );
    return Column(
      children: [
        Text(
          text,
          style: textStyle,
          textAlign: TextAlign.start,
        ),
        const Divider()
      ],
    );
  }
}
