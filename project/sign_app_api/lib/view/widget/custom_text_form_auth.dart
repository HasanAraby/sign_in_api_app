import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?)? valid;
  final bool num;
  final bool? obscureText;
  final void Function()? onTapIcon;
  const CustomTextFormAuth(
      {super.key,
      required this.hinttext,
      required this.labeltext,
      required this.iconData,
      required this.mycontroller,
      required this.valid,
      this.num = false,
      this.obscureText,
      this.onTapIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        keyboardType: num ? TextInputType.phone : TextInputType.text,
        validator: valid,
        controller: mycontroller,
        obscureText: obscureText == true ? true : false,
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: const TextStyle(fontSize: 14),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
          label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(labeltext)),
          suffixIcon: InkWell(onTap: onTapIcon, child: Icon(iconData)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
