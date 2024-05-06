import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final maxLength;
  final type;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.maxLength,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: SizedBox(
        width: 300,
        height: 41,
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: type,
          maxLength: maxLength,
          style: TextStyle(fontSize: 16.0),
          decoration: InputDecoration(
            counterText: "",
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color.fromRGBO(212, 212, 212, 1),
            ),
            contentPadding: const EdgeInsets.all(10.0),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromRGBO(212, 212, 212, 1),
              ),
            ),
            fillColor: Colors.white,
            filled: true,
          ),
        ),
      ),
    );
  }
}
