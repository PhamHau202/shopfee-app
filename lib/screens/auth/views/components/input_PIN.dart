import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shopfee_app/route/route_constants.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({super.key});

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  TextEditingController pinController = TextEditingController();
  String currentPin = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input your PIN"),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            Image.asset(
              "/images/input/pin_illustration.png", 
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 24),
            const Text(
              "Enter 6 digit PIN for secure account access",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 24),
            PinCodeTextField(
              appContext: context,
              length: 6,
              controller: pinController,
              obscureText: true,
              animationType: AnimationType.fade,
              keyboardType: TextInputType.number,   
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,   
              ],
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.circle,
                fieldHeight: 30,
                fieldWidth: 30,
                activeFillColor: Colors.white,
                inactiveFillColor: Colors.white,
                selectedFillColor: Colors.white,
                activeColor: Colors.black,
                selectedColor: Colors.black,
                inactiveColor: Colors.grey.shade300,
              ),
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              onChanged: (value) {
                setState(() {
                  currentPin = value;
                });
              },
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                 Navigator.pushNamed(context, createPinCodeScreenRoute);
              },
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Forgot PIN? ",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: "Change PIN.",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: currentPin.length == 6 ? () {
                  
                  //navigate to the home screen
                  Navigator.pushNamed(context, homeSkeletonScreenRoute);
                } : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  disabledBackgroundColor: Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text("Confirm", style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
