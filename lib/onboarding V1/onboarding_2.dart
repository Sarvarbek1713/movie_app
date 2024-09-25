import 'package:flutter/material.dart';
import 'package:movie_app/h%20(2).dart';

class OnBoardingPage2 extends StatelessWidget with ScreenSizeUtil {
  const OnBoardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1F1D2B),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  child: Image.asset(
                    'assets/images/onboarding_2.2.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  child: Image.asset(
                    'assets/images/onboarding_2.3.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: getWidth(context) * 0.085)
                      .copyWith(top: getHeight(context) * 0.056),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'В хорошем кино каждый кадр не случаен',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(
                        0xffffffff,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Пользователь имеет возможность посещать кинотеатры в своем городе совершенно бесплатно!.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
