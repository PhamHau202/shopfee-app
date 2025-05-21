import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopfee_app/components/dot_indicators.dart';
import 'package:shopfee_app/constants.dart';
import 'package:shopfee_app/route/route_constants.dart';

import '../views/components/onboarding_content.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}


class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;
  final List<Onboard> _onboardData = [
    Onboard(
      image: "/illustration/illustration1.png",
      title: "Choose and customize your Drinks",
      description: "Customize your own drink exactly how you like it by adding any topping you like!!!",
    ),
    Onboard(
      image: "/illustration/illustration2.png",
      title: "Quickly and easly",
      description: "You can place your order quickly and easly without wasting time. You can also schedule orders via your smarthphone.",
    ),
    Onboard(
      image: "/illustration/illustration3.png",
      title: "Get and Redeem Voucher",
      description: "Exciting prizes await you! Redeem yours by collecting all the points after purchase in the app!",
    ),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child:
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, registerScreenRoute);
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(
                            color: Theme.of(context).textTheme.bodyLarge!.color),
                      ),
                    ),
                  ),
                ),

              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _onboardData.length,
                  onPageChanged: (value) {
                    setState(() {
                      _pageIndex = value;
                    });
                  },
                  itemBuilder: (context, index) => OnboardingContent(
                    title: _onboardData[index].title,
                    description: _onboardData[index].description,
                    image: _onboardData[index].image,
                    //isTextOnTop: index.isOdd,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 40.h),
                child: Row(
                  children: [                  
                    DotIndicator(currentIndex: _pageIndex, totalDots: 3),
                    const Spacer(),
                    SizedBox(
                      width: _pageIndex < _onboardData.length - 1 ? 156.w : 175.w,
                      height: 48.h,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_pageIndex < _onboardData.length - 1) {
                            _pageController.nextPage(
                                curve: Curves.ease, duration: defaultDuration);
                          } else {
                            Navigator.pushNamed(context, registerScreenRoute);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5B4034), 
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: _pageIndex < _onboardData.length - 1 ? EdgeInsets.only(left: 20) : EdgeInsets.zero,
                              child:
                            Text(
                              _pageIndex < _onboardData.length - 1 ? 'NEXT' : 'Login/Register',
                              style: TextStyle(
                                fontSize: _pageIndex < _onboardData.length - 1 ? 16.sp : 15.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            )),
                            SizedBox(width: 8.w),
                            Padding(
                              padding: _pageIndex < _onboardData.length - 1 ? EdgeInsets.only(left: 20) : EdgeInsets.zero,
                              child: Icon(Icons.arrow_forward, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class Onboard {
  final String image, title, description;

  Onboard({
    required this.image,
    required this.title,
    this.description = ""
  });
}

