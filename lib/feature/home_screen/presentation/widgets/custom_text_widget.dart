import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;
  final TextAlign textAlign;
  final TextDecoration textDecoration;
  final TextStyle? customStyle;
  final FontStyle fontStyle;

  const CustomTextWidget(
      {super.key,
      required this.text,
      this.fontSize = 16.0,
      this.fontWeight = FontWeight.normal,
      this.textColor = Colors.black,
      this.backgroundColor = Colors.transparent,
      this.padding = const EdgeInsets.all(0),
      this.textAlign = TextAlign.start,
      this.textDecoration = TextDecoration.none,
      this.customStyle,
      this.fontStyle = FontStyle.normal});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      color: backgroundColor,
      child: Text(
        text,
        textAlign: textAlign,
        style: customStyle ??
            TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: textColor,
                decoration: textDecoration,
                fontStyle: fontStyle),
      ),
    );
  }
}
