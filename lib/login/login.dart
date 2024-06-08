import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/h%20(2).dart';

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
        // leading: const Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 24),
        //   child: Icon(Icons.chevron_left_rounded),
        // ),
        centerTitle: true,
        backgroundColor: const Color(0xff1F1D2B),
        iconTheme: const IconThemeData(
          size: 24,
          color: Colors.white,
        ),
        title: const Text(
          'Login',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Color(0xff1F1D2B),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getWidth(context) * 0.09,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Row(
            //   children: [
            //     IconButton(
            //       onPressed: () {},
            //       icon: const Icon(
            //         Icons.chevron_left,
            //         size: 32,
            //       ),
            //     ),
            //     const SizedBox(
            //       width: 10,
            //     ),
            //     const Text(
            //       'Login',
            //       style: TextStyle(
            //           fontSize: 16,
            //           fontWeight: FontWeight.w600,
            //           color: Colors.white),
            //     ),
            //   ],
            // ),
            const Column(
              children: [
                Text(
                  'Hi,Tiffany',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                Text(
                  'Welcome back! Please enter your details.',
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffEBEBEF)),
                )
              ],
            ),
            Column(
              children: [
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email Adress',
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
                      EdgeInsets.symmetric(vertical: getHeight(context) * 0.04)
                          .copyWith(bottom: getHeight(context) * 0.01),
                  child: TextField(
                    obscureText: true,
                    controller: passwordlController,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.white),
                      suffixIcon: const Icon(Icons.remove_red_eye),
                      suffixIconColor: const Color(0xffEBEBEF),
                      suffixIconConstraints: const BoxConstraints(minWidth: 50),
                      counter: InkWell(
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xff12CDD9),
                            ),
                          ),
                        ),
                      ),
                      labelText: 'Password',
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
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
                minimumSize: Size(double.infinity, getHeight(context) * 0.065),
                backgroundColor: Color(0xff12CDD9),
              ),
              onPressed: () {},
              child: const Text(
                'Login',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
