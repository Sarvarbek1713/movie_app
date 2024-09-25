import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/h%20(2).dart';
import 'package:movie_app/home/home_page.dart';
import 'package:movie_app/login/password_toggle_text_field.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({
    super.key,
  });

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> with ScreenSizeUtil {
  final signEmailController = TextEditingController();

  final nameController = TextEditingController();

  final signPassController = TextEditingController();

  final regPassController = TextEditingController();

  bool isCheked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1F1D2B),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff1F1D2B),
        iconTheme: const IconThemeData(
          size: 24,
          color: Colors.white,
        ),
        title: const Text(
          'Зарегистрироваться',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20, top: 15),
          child: IconButton(
            style: IconButton.styleFrom(
              backgroundColor: const Color(0xff252836),
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(context) * 0.064)
            .copyWith(top: getHeight(context) * 0.05),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric().copyWith(
                  bottom: getHeight(context) * 0.079,
                ),
                child: const Column(
                  children: [
                    Text(
                      'Давайте начнем',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Новейшие фильмы и сериалы ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffEBEBEF),
                      ),
                    ),
                    Text(
                      'здесь',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffEBEBEF),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  TextField(
                    style: const TextStyle(
                      color: Color(0xffEBEBEF),
                    ),
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Имя',
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
                    padding: EdgeInsets.symmetric(
                        vertical: getHeight(context) * 0.0259),
                    child: TextField(
                      style: const TextStyle(
                        color: Color(0xffEBEBEF),
                      ),
                      controller: signEmailController,
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
                    Controller: regPassController,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric()
                      .copyWith(bottom: getHeight(context) * 0.071),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox.adaptive(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        activeColor: const Color(0xff12CDD9),
                        checkColor: const Color(0xff1e9db4),
                        value: isCheked,
                        onChanged: (value) {
                          setState(
                            () {
                              isCheked = value!;
                            },
                          );
                        },
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Я согласен с',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff92929D),
                                  ),
                                ),
                                TextSpan(
                                  text: ' Условиями использования',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff12CDD9),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            textAlign: TextAlign.start,
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'и ',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff92929D),
                                  ),
                                ),
                                TextSpan(
                                  text: ' Политикой конфиденциальности',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff12CDD9),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  // minimumSize:

                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return const Color.fromARGB(255, 2, 115, 123);
                      }
                      return const Color(0xff12CDD9);
                    },
                  ),
                ),
                //   backgroundColor: isCheked
                //       ? Color(0xff12CDD9)
                //       : Colors.red,
                // ),
                onPressed: isCheked
                    ? () {
                        register(nameController.text, signEmailController.text,
                            regPassController.text, context);
                      }
                    : null,
                child: const Row(
                  children: [
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        'Зарегистрироваться',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChekboxExample extends StatefulWidget {
  const ChekboxExample({
    super.key,
  });

  @override
  State<ChekboxExample> createState() => _ChekboxState();
}

class _ChekboxState extends State<ChekboxExample> {
  bool isCheked = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox.adaptive(
      shape: RoundedRectangleBorder(
        side: const BorderSide(),
        borderRadius: BorderRadius.circular(6),
      ),
      materialTapTargetSize: MaterialTapTargetSize.padded,
      activeColor: const Color(0xff12CDD9),
      checkColor: const Color(0xff1e9db4),
      value: isCheked,
      onChanged: (value) {
        setState(
          () {
            isCheked = value!;
          },
        );
      },
    );
  }
}

Future<void> register(String fullName, String email, String password,
    BuildContext context) async {
  try {
    final response = await http.post(
      Uri.parse('https://kino-1.onrender.com/regis'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'fullname': fullName,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Успешная регистрация
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Регистрация успешна'),
          content: Text('Вы успешно зарегистрировались!'),
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
    } else {
      throw Exception(
          'Failed to register with status code: ${response.statusCode}');
    }
  } catch (e) {
    showDialog(
      // ignore: use_build_context_synchronously
      context: context,
      builder: (context) => const HomePage(),
      //  AlertDialog(
      //   title: Text('Ошибка регистрации'),
      //   content: Text('Ошибка при попытке регистрации: $e'),
      //   actions: <Widget>[
      //     TextButton(
      //       onPressed: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => const HomePage(),
      //           ),
      //         ); // Закрыть диалог
      //       },
      //       child: Text('OK'),
      //     ),
      //   ],
      // ),
    );
  }
}
