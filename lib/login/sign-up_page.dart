import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/h%20(2).dart';
import 'package:movie_app/login/login.dart';

class SignUpLogin extends StatelessWidget with ScreenSizeUtil {
  const SignUpLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff171725),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(context) * 0.085),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                SvgPicture.asset(
                  height: getHeight(context) * 0.108,
                  width: getWidth(context) * 0.234,
                  'assets/icons/Vector.svg',
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: getHeight(context) * 0.03)
                          .copyWith(bottom: getHeight(context) * 0.01),
                  child: const Text(
                    "CINEMAX",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                const Text(
                  'Enter your registered ',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ),
                const Text(
                  'Phone Number to Sign Up',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    minimumSize:
                        Size(double.infinity, getHeight(context) * 0.065),
                    backgroundColor: Color(0xff12CDD9),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: getHeight(context) * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'I already have an account?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    IconButton(
                      style: ButtonStyle(),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  LoginPage(),
                          ),
                        );
                      },
                      icon: const Text(
                        ' Login',
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
            Column(
              children: [
                const Text(
                  'Or Sign Up with',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
                SizedBox(
                  height: getHeight(context) * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/Google.svg',
                          height: getHeight(context) * 0.085,
                          width: getWidth(context) * 0.184,
                        )),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icons/Apple.svg',
                        height: getHeight(context) * 0.085,
                        width: getWidth(context) * 0.184,
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/Facebook.svg',
                          height: getHeight(context) * 0.085,
                          width: getWidth(context) * 0.184,
                        )),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
