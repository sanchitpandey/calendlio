import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  String text;
  TextStyle textStyle;
  Color bg, border;

  Button(this.text, this.textStyle, this.bg, this.border);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(vertical: 13),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: border),
        color: bg,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
