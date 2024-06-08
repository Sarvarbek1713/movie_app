import 'package:flutter/material.dart';
import 'package:movie_app/h%20(2).dart';

class ButtonWidget extends StatelessWidget with ScreenSizeUtil {
  const ButtonWidget({
    super.key,
    required this.buttonName,
    required this.functionApply,
  });
  final VoidCallback functionApply;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        
        minimumSize: Size(double.infinity, getHeight(context) * 0.065),
        backgroundColor: const Color(0xff12CDD9),
      ),
      onPressed: functionApply,
      child: Text(
        buttonName,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
      ),
    );
  }
}
