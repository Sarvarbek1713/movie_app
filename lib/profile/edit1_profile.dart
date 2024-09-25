import 'package:flutter/material.dart';
import 'package:movie_app/button_widget.dart';
import 'package:movie_app/h%20(2).dart';
import 'package:movie_app/login/password_toggle_text_field.dart';

class EditPage extends StatelessWidget with ScreenSizeUtil {
  EditPage({super.key});
  final profNameController = TextEditingController();
  final profEmailController = TextEditingController();
  final profPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1F1D2B),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Text(
                textAlign: TextAlign.center,
                'Профиль',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
            TextField(
              style: const TextStyle(
                color: Color(0xffEBEBEF),
              ),
              controller: profNameController,
              decoration: InputDecoration(
                labelText: 'Полное имя',
                labelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffEBEBEF),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: getHeight(context) * 0.0259),
              child: TextField(
                style: const TextStyle(
                  color: Color(0xffEBEBEF),
                ),
                controller: profEmailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffEBEBEF),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ),
            PasswordToggleTextField(
              Controller: profPasswordController,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: getHeight(context) * 0.0259),
              child: ButtonWidget(
                buttonName: 'Save changes',
                functionApply: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
