import 'package:flutter/material.dart';
import 'dart:async';

import 'package:shopfee_app/route/route_constants.dart';

class OtpWaitingScreen extends StatefulWidget {
  final String phoneNumber;
  final bool isFinalProcessing;
  final dynamic user;

  const OtpWaitingScreen({super.key, required this.phoneNumber, required this.isFinalProcessing, required this.user});

  @override
  State<OtpWaitingScreen> createState() => _OtpWaitingScreenState();
}

class _OtpWaitingScreenState extends State<OtpWaitingScreen> {
  Timer? _timer;
  int secondsRemaining = 60; 

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    _timer?.cancel(); 
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (secondsRemaining > 0) {
            secondsRemaining--;
        } else {
          _timer?.cancel();   
          if(widget.isFinalProcessing)
          {
              Navigator.pushNamedAndRemoveUntil(context, createPinCodeScreenRoute,(route) => false, arguments: {
                "user": widget.user
              });
          }
          else{            
            navigateToOtpInput();
          }     
        }
      });
    });

    
  }

  void navigateToOtpInput() async{
    await Navigator.pushReplacementNamed(context, otpCodeConfirmScreenRoute, arguments: {
                                  "phoneNumber" : widget.phoneNumber,
                                  "user" : widget.user,
                                },);
  }

  @override
  void dispose() {
    _timer?.cancel(); // Always cancel timer on dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "/images/input/img_loading.gif", 
                width: 120,
              ),
              const SizedBox(height: 24),

              // Text message with countdown
              Text( widget.isFinalProcessing
                    ? "Please wait a minute" :
                "Please wait $secondsRemaining seconds,",
                style: const TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.isFinalProcessing
                    ? "we are processing your account."
                    : "we will send you the OTP code.",
                style: const TextStyle(
                  fontSize: 14, 
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              
              // Loading indicator
              const CircularProgressIndicator(),
              const SizedBox(height: 20),
              
              // Manual navigation button
              if(!widget.isFinalProcessing)
                TextButton(
                  onPressed: navigateToOtpInput,
                  child: const Text(
                    "I've received the code",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}