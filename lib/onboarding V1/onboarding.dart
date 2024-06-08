import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/h%20(2).dart';
import 'package:movie_app/login/log_in.dart';
import 'package:movie_app/onboarding%20V1/onboarding_1.dart';
import 'package:movie_app/onboarding%20V1/onboarding_2.dart';
import 'package:movie_app/onboarding%20V1/onboarding_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> with ScreenSizeUtil {
  final PageController _pageController = PageController(initialPage: 0);

  final List _pages = [
    const OnBoardingPage1(),
    const OnBoardingPage2(),
    const OnBoardingPage3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(
                  () {},
                );
              },
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                return _pages[index % _pages.length];
              },
            ),
          ),
          Positioned(
            bottom: getHeight(context) * 0.08,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: getWidth(context) * 0.064),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: _pages.length,
                    effect: const ExpandingDotsEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      activeDotColor: Color(0xff12CDD9),
                    ),
                  ),
                  SizedBox(
                    width: getWidth(context) * 0.55,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>   SignUpLogin(),
                        ),
                      );
                    },
                    child: SvgPicture.asset(
                      'assets/icons/Next.svg',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
