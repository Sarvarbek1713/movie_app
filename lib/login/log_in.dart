import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/h%20(2).dart';
import 'package:movie_app/button_widget.dart';
import 'package:movie_app/login/login.dart';
import 'package:movie_app/login/sign_up.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> signInUser(String email, String password) async {
  var url =
      'https://kino-1.onrender.com/login'; // Замените на адрес вашего сервера API
  var response = await http.post(
    Uri.parse(url),
    body: jsonEncode({
      'email': email,
      'password': password,
    }),
    headers: {
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    // Обработка успешного входа
    print('Пользователь успешно вошел в систему');
  } else {
    // Обработка ошибки
    print('Ошибка при входе пользователя: ${response.statusCode}');
    print(response.body);
  }
}

class SignUpLogin extends StatelessWidget with ScreenSizeUtil {
  SignUpLogin({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff171725),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(context) * 0.085),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SvgPicture.asset(
                  height: getHeight(context) * 0.108,
                  width: getWidth(context) * 0.234,
                  'assets/icons/111.svg',
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: getHeight(context) * 0.03)
                          .copyWith(bottom: getHeight(context) * 0.01),
                  child: const Text(
                    "КИНОМАН",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                const Text(
                  'Нажмите для регистрации ',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ),
                // const Text(
                //   'Phone Number to Sign Up',
                //   style: TextStyle(
                //       fontSize: 14,
                //       fontWeight: FontWeight.w600,
                //       color: Colors.grey),
                // ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                //
                ButtonWidget(
                  buttonName: 'Зарегистрироваться',
                  functionApply: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SingUpPage()));
                  },
                ),
                SizedBox(
                  height: getHeight(context) * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'У уже есть аккаунт?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    IconButton(
                      style: const ButtonStyle(),
                      onPressed: () {
                        signInUser(
                            emailController.text, passwordController.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      icon: const Text(
                        ' Войти',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff12CDD9),
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                )
              ],
            ),
            // Column(
            //   children: [
            //     const Text(
            //       'Or Sign Up with',
            //       style: TextStyle(
            //           fontSize: 14,
            //           fontWeight: FontWeight.w500,
            //           color: Colors.grey),
            //     ),
            //     SizedBox(
            //       height: getHeight(context) * 0.05,
            //     ),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       children: [
            //         IconButton(
            //             onPressed: () {},
            //             icon: SvgPicture.asset(
            //               'assets/icons/Google.svg',
            //               height: getHeight(context) * 0.085,
            //               width: getWidth(context) * 0.184,
            //             )),
            //         IconButton(
            //           onPressed: () {},
            //           icon: SvgPicture.asset(
            //             'assets/icons/Apple.svg',
            //             height: getHeight(context) * 0.085,
            //             width: getWidth(context) * 0.184,
            //           ),
            //         ),
            //         IconButton(
            //             onPressed: () {},
            //             icon: SvgPicture.asset(
            //               'assets/icons/Facebook.svg',
            //               height: getHeight(context) * 0.085,
            //               width: getWidth(context) * 0.184,
            //             )),
            //       ],
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
