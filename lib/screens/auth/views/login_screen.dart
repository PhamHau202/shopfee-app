import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shopfee_app/constants.dart';
import 'package:shopfee_app/route/route_constants.dart';
import 'package:shopfee_app/screens/auth/views/components/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    LoginForm(),
                    const SizedBox(height: 250), 
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                      const TextSpan(text: "Don't have an account? "),
                      TextSpan(
                        text: "Register",
                        style: const TextStyle(
                          color: purpleColor,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, registerScreenRoute);
                          },
                      ),
                    ]
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}