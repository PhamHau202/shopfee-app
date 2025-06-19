import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shopfee_app/route/route_constants.dart';

class ConfirmOtpScreen extends StatefulWidget {
  final String phoneNumber;
  final dynamic user;
  const ConfirmOtpScreen({super.key, required this.phoneNumber, required this.user});

  @override
  State<ConfirmOtpScreen> createState() => _ConfirmOtpScreenState();
}

class _ConfirmOtpScreenState extends State<ConfirmOtpScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isComplete = otpController.text.length == 5;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Confirm OTP code"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              const SizedBox(height: 24),
              Text(
                widget.phoneNumber,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Enter the 5-digit OTP code that has been sent from SMS to complete your account registration",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              const SizedBox(height: 32),

              // OTP Input
              PinCodeTextField(
                appContext: context,
                length: 5,
                controller: otpController,
                keyboardType: TextInputType.number,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 55,
                  fieldWidth: 50,
                  activeColor: const Color(0xFF5A4036),
                  selectedColor: const Color(0xFF5A4036),
                  inactiveColor: Colors.grey.shade300,
                  activeFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  borderWidth: 1.5,
                ),
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                onChanged: (value) {
                  setState(() {});
                },
              ),
              const SizedBox(height: 16),

              // Resend
              const Text(
                "Haven't got the confirmation code yet?",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              const SizedBox(height: 4),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, otpCodeLoadingScreenRoute, arguments: {
                          "phoneNumber" : widget.phoneNumber,
                          "isFinalProcessing" : false
                        });
                },
                child: const Text(
                  "Resend",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              const SizedBox(height: 24),

              // Confirm Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: isComplete
                      ? () {
                           Navigator.pushNamed(context, otpCodeLoadingScreenRoute, arguments: {
                            "phoneNumber" : widget.phoneNumber,
                            "isFinalProcessing" : true,
                            "user" : widget.user,
                          });
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isComplete ? const Color(0xFF5A4036) : Colors.grey.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Confirm",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
