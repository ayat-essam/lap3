import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormVeled extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Widget? IconD;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final TextEditingController? controller;


  const TextFormVeled({
    super.key,
    this.validator,
    this.keyboardType,
    this.IconD,
    this.hintText,
    this.labelText,
    this.errorText, this.controller, required bool obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        labelText: labelText,
        hintText: hintText,
        suffixIcon: IconD,


      ),


    );



  }
}
