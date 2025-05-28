
import 'package:flutter/material.dart';
import 'package:shopfee_app/route/route_constants.dart';
import 'package:shopfee_app/screens/account/views/account_screen.dart';
import 'package:shopfee_app/screens/auth/views/login_screen.dart';
import 'package:shopfee_app/screens/auth/views/register_screen.dart';
import 'package:shopfee_app/screens/entry_point.dart';
import 'package:shopfee_app/screens/history/views/history_screen.dart';
import 'package:shopfee_app/screens/home/views/home_screen.dart';
import 'package:shopfee_app/screens/home/views/home_skelton_screen.dart';
import 'package:shopfee_app/screens/onboarding/views/onboarding_screen.dart';
import 'package:shopfee_app/screens/product/views/product_detail.dart';
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
      case homeScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
      );
      case homeSkeletonScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const HomeSkeletonScreen(),
      );
      case entryPointScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const EntryPoint(),
      );
      case productDetailScreenRoute:   
        final product = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => ProductDetailScreen(product: product),
        );
      case checkoutScreenRoute:   
        final product = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => ProductDetailScreen(product: product),
        );


      case historyScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const HistoryScreen(),
      );
      case accountScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const AccountScreen(),
      );

default:
      return MaterialPageRoute(
        // Make a screen for undefine
        builder: (context) => const OnBoardingScreen(),
      );
  }
}