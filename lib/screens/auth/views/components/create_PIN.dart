import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shopfee_app/route/route_constants.dart';
import 'package:shopfee_app/service/api_service.dart';

class CreatePinCodeScreen extends StatefulWidget {
  const CreatePinCodeScreen({super.key, required this.user});

  final dynamic user;

  @override
  State<CreatePinCodeScreen> createState() => _CreatePinCodeScreenState();
}

class _CreatePinCodeScreenState extends State<CreatePinCodeScreen> {
  TextEditingController pinController = TextEditingController();
  String currentPin = "";
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create a PIN"),
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
              "Enter 6 numbers to keep your account safe",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 24),
            PinCodeTextField(
              appContext: context,
              length: 6,
              controller: pinController,
              obscureText: isObscure,
              obscuringCharacter: "●",
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
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
            Align(
              alignment: Alignment.centerRight,
              child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("Show your PIN", style: TextStyle(color: Colors.black),),
                    IconButton(
                      icon: Icon(
                        isObscure ?  Icons.visibility_off_outlined : Icons.visibility_outlined ,
                      ),
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                    )
                  ]
                )
            ),
           const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: currentPin.length == 6 ? () async {
                  bool registerSuccess = await ApiService.registerUser(widget.user["name"], widget.user["phoneNumber"], currentPin);
                      if (registerSuccess) {
                        //navigate to the home screen
                        Navigator.pushNamed(context, homeSkeletonScreenRoute);
                      } else {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text('Error'),
                            content: Text('Failed to register user.'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pushNamed(context, registerScreenRoute),
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }                                        
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
