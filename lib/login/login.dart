// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/button_widget.dart';
import 'package:movie_app/h%20(2).dart';
import 'package:movie_app/home/home_page.dart';
import 'package:movie_app/login/password_toggle_text_field.dart';

class LoginPage extends StatelessWidget with ScreenSizeUtil {
  LoginPage({
    super.key,
  });

  final emailController = TextEditingController();
  final passwordlController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff1F1D2B),
        iconTheme: const IconThemeData(
          size: 24,
          color: Colors.white,
        ),
        title: const Text(
          'Войти',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 20, top: 15),
          child: IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Color(0xff252836),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.chevron_left),
          ),
        ),
      ),
      backgroundColor: const Color(0xff1F1D2B),
      body: Padding(
        padding: EdgeInsets.symmetric(
                vertical: 0, horizontal: getWidth(context) * 0.064)
            .copyWith(top: getHeight(context) * 0.1),
        child: ListView(
          // mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: getHeight(context) * 0.03),
                    child: TextField(
                      style: const TextStyle(
                        color: Color(0xffEBEBEF),
                      ),
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                        labelStyle: const TextStyle(
                          color: Color(0xffEBEBEF),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: getHeight(context) * 0.05),
                    child: PasswordToggleTextField(
                      Controller: passwordlController,
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(top: getHeight(context) * 0.001),
                  //   child: InkWell(
                  //     onTap: () {
                  //       // NavigatoFr.push(
                  //       //   context,
                  //       //   MaterialPageRoute(
                  //       //     builder: (context) => ResetPassword(),
                  //       //   ),
                  //       // );
                  //     },
                  //     child: const Text(
                  //       'Forgot Password?',
                  //       style: TextStyle(
                  //         fontWeight: FontWeight.w500,
                  //         fontSize: 12,
                  //         color: Color(0xff12CDD9),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            ButtonWidget(
              functionApply: () => login(
                  emailController.text, passwordlController.text, context),
              buttonName: 'Войти',
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> login(String email, String password, BuildContext context) async {
  try {
    final response = await http.post(
      Uri.parse('https://kino-1.onrender.com/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Успешный логин
      showDialog(
        context: context,
        builder: (context) => HomePage(),
        //  AlertDialog(
        //   title: Text('Успех'),
        //   content: Text('Вы успешно вошли в систему!'),
        //   actions: <Widget>[
        //     TextButton(
        //       onPressed: () {
        //         Navigator.pop(context);
        //       },
        //       child: const Text('OK'),
        //     ),
        //   ],
        // ),
      );
    } else {
      // Ошибка при логине
      throw Exception(
          'Не удалось войти в систему с кодом состояния: ${response.statusCode}');
    }
  } catch (e) {
    // Отображение ошибки
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Ошибка'),
        content: Text('E-mail или пароль неправильный: $e'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Закрыть диалог
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
    