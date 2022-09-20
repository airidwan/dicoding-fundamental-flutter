import 'package:flutter/material.dart';

class LoginInputWidget extends StatelessWidget {
  final TextEditingController txtController;
  final String? hintText;
  final bool obscureText;
  final ValueChanged<String>? onchanged;
  const LoginInputWidget({Key? key, required this.txtController, this.hintText, this.obscureText = false, this.onchanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(height: 45, width: 300),
      child: TextField(
        controller: txtController,
        autofocus: false,
        obscureText: obscureText,
        onChanged: onchanged,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 5),
          hintText: hintText,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(style: BorderStyle.none, width: 0.0),
            borderRadius: BorderRadius.all(
              Radius.circular(3),
            ),
          ),
        ),
      ),
    );
  }
}