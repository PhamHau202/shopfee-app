
import 'package:flutter/material.dart';
import 'package:shopfee_app/route/route_constants.dart';
import 'package:shopfee_app/screens/auth/views/login_screen.dart';
import 'package:shopfee_app/screens/auth/views/register_screen.dart';
import 'package:shopfee_app/screens/onboarding/views/onboarding_screen.dart';
import 'package:shopfee_app/screens/splash/views/splash_screen.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case onBoardingScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const OnBoardingScreen(),
      );
      case splashScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
      );
      case registerScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
      );
      case logInScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
      );
      // case passwordRecoveryScreenRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => const PasswordRecoveryScreen(),
      // );


default:
      return MaterialPageRoute(
        // Make a screen for undefine
        builder: (context) => const OnBoardingScreen(),
      );
  }
}