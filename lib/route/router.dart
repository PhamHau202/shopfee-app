
import 'package:flutter/material.dart';
import 'package:shopfee_app/route/route_constants.dart';
import 'package:shopfee_app/screens/account/views/account_screen.dart';
import 'package:shopfee_app/screens/auth/views/components/create_PIN.dart';
import 'package:shopfee_app/screens/auth/views/components/input_PIN.dart';
import 'package:shopfee_app/screens/auth/views/login_screen.dart';
import 'package:shopfee_app/screens/auth/views/register_screen.dart';
import 'package:shopfee_app/screens/checkout/views/checkout_screen.dart';
import 'package:shopfee_app/screens/entry_point.dart';
import 'package:shopfee_app/screens/history/views/history_orders_screen.dart';
import 'package:shopfee_app/screens/home/views/home_screen.dart';
import 'package:shopfee_app/screens/home/views/home_skelton_screen.dart';
import 'package:shopfee_app/screens/onboarding/views/onboarding_screen.dart';
import 'package:shopfee_app/screens/otp_code/views/otp_code_confirm.dart';
import 'package:shopfee_app/screens/otp_code/views/otp_code_loading.dart';
import 'package:shopfee_app/screens/payment/views/payment_screen.dart';
import 'package:shopfee_app/screens/product/views/product_detail_screen.dart';
import 'package:shopfee_app/screens/rating_review/views/rating_review_screen.dart';
import 'package:shopfee_app/screens/splash/views/splash_screen.dart';
import 'package:shopfee_app/screens/tracking_order/views/tracking_order_screen.dart';
import 'package:shopfee_app/screens/transaction/views/transaction_screen.dart';
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
      case pinCodeScreenRoute:
        final args = settings.arguments as Map<String, dynamic>?;
        final pinCode = args?["pinCode"];
        return MaterialPageRoute(builder: (context) =>  PinCodeScreen(pinCode: pinCode));
      case createPinCodeScreenRoute:
        final args = settings.arguments as Map<String, dynamic> ?;
        final user = args?["user"];
        return MaterialPageRoute(builder: (context) => CreatePinCodeScreen(user: user));
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

      case otpCodeLoadingScreenRoute:
        final args = settings.arguments as Map<String, dynamic>?;
        final phoneNumber = args?['phoneNumber'];
        final user = args?['user'];
        final isFinalProcessing = args?['isFinalProcessing'];
        
        return MaterialPageRoute(
          builder: (context) => OtpWaitingScreen(phoneNumber : phoneNumber, isFinalProcessing: isFinalProcessing, user: user),
        );

      case otpCodeConfirmScreenRoute:
        final args = settings.arguments as Map<String, dynamic>?;
        final phoneNumber = args?['phoneNumber'];
        final user = args?['user'];
        return MaterialPageRoute(
          builder: (context) => ConfirmOtpScreen(phoneNumber : phoneNumber, user: user),
        );

      case transactionScreenRoute:   
      final args = settings.arguments as Map<String, dynamic>?;
      final receiptOrder = args?["receiptOrder"];
      
      return MaterialPageRoute(
        builder: (context) => TransactionScreen(receiptOrder: receiptOrder),
      );

      case trackingOrderScreenRoute:
       final args = settings.arguments as Map<String, dynamic>?;
       final receiptOrder = args?["receiptOrder"];
        return MaterialPageRoute(
          builder: (context) => TrackingOrderScreen(receiptOrder: receiptOrder),
      );

      case ratingReviewScreenRoute:
       final args = settings.arguments as Map<String, dynamic>?;
       final orderId = args?["orderId"];
       final productId = args?["productId"];
        return MaterialPageRoute(
          builder: (context) => RatingReviewScreen(orderId: orderId, productId: productId),
      );

      case historyScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const HistoryOrdersScreen(),
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