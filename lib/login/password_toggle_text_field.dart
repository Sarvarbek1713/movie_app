import 'package:flutter/material.dart';

class PasswordToggleTextField extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final TextEditingController Controller;
  // ignore: non_constant_identifier_names
  const PasswordToggleTextField({super.key, required this.Controller});

  @override
  // ignore: library_private_types_in_public_api
  _PasswordToggleTextFieldState createState() =>
      _PasswordToggleTextFieldState();
}

class _PasswordToggleTextFieldState extends State<PasswordToggleTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white, fontSize: 16),
      controller: widget.Controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: 'Пароль',
        labelStyle: const TextStyle(
          color: Color(0xffEBEBEF),
        ),
        suffixIcon: IconButton(
          icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(
              () {
                _obscureText = !_obscureText;
              },
            );
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
}
