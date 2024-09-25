import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/h%20(2).dart';

class OnBoardingPage1 extends StatelessWidget with ScreenSizeUtil {
  const OnBoardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1F1D2B),
      body: Column(
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/onboarding_1.png',
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
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
                    'Смотреть хорошее кино дома — приятное занятие!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(
                        0xffffffff,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Находить новые фильмы быстро и просто — это удовольствие, а если это еще и можно делать в любое удобное время, планируя просмотр фильма заранее — пользовательские требования будут удовлетворены.',
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
