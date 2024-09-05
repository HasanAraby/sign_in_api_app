import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  final String txt;
  final double fntSz;
  final FontWeight fntWht;
  TextAlign? txtAlign;
  CustomText(
      {super.key,
      required this.txt,
      required this.fntSz,
      required this.fntWht,
      this.txtAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
        fontSize: fntSz,
        fontWeight: fntWht,
      ),
      textAlign: txtAlign,
    );
  }
}
