import 'package:flutter/material.dart';
import 'package:shopfee_app/constants.dart';
import 'package:shopfee_app/route/route_constants.dart';
import 'package:shopfee_app/screens/auth/views/components/register_form.dart';
import 'package:flutter/gestures.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

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
                    RegisterForm(),
                    const SizedBox(height: 120),
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
                      const TextSpan(text: "Have an account? "),
                      TextSpan(
                        text: "Login",
                        style: const TextStyle(
                          color: purpleColor,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, logInScreenRoute);
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