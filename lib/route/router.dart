
import 'package:flutter/material.dart';
import 'package:shopfee_app/route/route_constants.dart';
import 'package:shopfee_app/screens/account/views/account_screen.dart';
import 'package:shopfee_app/screens/auth/views/login_screen.dart';
import 'package:shopfee_app/screens/auth/views/register_screen.dart';
import 'package:shopfee_app/screens/checkout/views/checkout_screen.dart';
import 'package:shopfee_app/screens/entry_point.dart';
import 'package:shopfee_app/screens/history/views/history_screen.dart';
import 'package:shopfee_app/screens/home/views/home_screen.dart';
import 'package:shopfee_app/screens/home/views/home_skelton_screen.dart';
import 'package:shopfee_app/screens/onboarding/views/onboarding_screen.dart';
import 'package:shopfee_app/screens/payment/views/payment_screen.dart';
import 'package:shopfee_app/screens/product/views/product_detail_screen.dart';
import 'package:shopfee_app/screens/splash/views/splash_screen.dart';
import 'package:shopfee_app/screens/voucher/views/voucher_screen.dart';


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
        final args = settings.arguments as Map<String, dynamic>?;
        final product = args?["product"];
        final flgEdit = args?["flgEdit"];
        
        return MaterialPageRoute(
          builder: (context) => ProductDetailScreen(product: product, flgEdit: flgEdit),
        );
      case checkoutScreenRoute:   
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => CheckoutScreen(
            listProductOrdered: args,
          ),
        );
      case paymentMethodScreenRoute:
        final args = settings.arguments as Map<String, dynamic>?;
        final totalPrice = args?['totalPrice'];
        final listTransferBank = args?["listTransferBank"];
        final isChooseTransferBanking = args?["isChooseTransferBanking"];
        final selectedCard = args?["selectedCard"];
        return MaterialPageRoute(
          builder: (context) => PaymentMethodScreen(totalPrice: totalPrice, listTransferBank:listTransferBank, isChooseTransferBanking: isChooseTransferBanking, selectedCard: selectedCard),
      );
      case voucherScreenRoute:
        final args = settings.arguments as Map<String, dynamic>?;
        final selectedVoucher = args?["selectedVoucher"];
        return MaterialPageRoute(
          builder: (context) => VoucherScreen(selectedVoucher: selectedVoucher),
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