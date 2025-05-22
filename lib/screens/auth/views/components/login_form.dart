import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopfee_app/constants.dart';
import 'package:shopfee_app/route/route_constants.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _phoneFocusNode = FocusNode();

  String? number_phone;
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();

    _phoneFocusNode.addListener(() {
      setState(() {});
    });
  }

  void checkFormValiddation() {
    setState(() {
      isButtonEnabled = _phoneController.text.isNotEmpty;
    });
  }

  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 147, left: 30),
            child: Image.asset(
              "/logo/shopfee_logo.png",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 8, bottom: 4),
              child: Text(
                'No. Handphone',
                style: TextStyle(
                  // fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          TextFormField(
            controller: _phoneController,
            focusNode: _phoneFocusNode,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            decoration: InputDecoration(
              hintText: _phoneFocusNode.hasFocus || _phoneController.text.isNotEmpty ? '' : 'Input your No. Handphone',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            validator: (value) {
              if ((value == null || value.isEmpty) && _nameController.text.isNotEmpty) {
                return 'Input your No. Handphone';
              }
              return null;
            },
            onSaved: (value) {
              number_phone = value;
            },
            onTap: () {
              setState(() {});
            },
            onChanged: (value) {
              checkFormValiddation();
            },
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: isButtonEnabled ? () {
                // Handle login logic

                //navigate to the home screen
                Navigator.pushNamed(context, homeSkeletonScreenRoute);
              } : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: isButtonEnabled ? Color(0xFF5B4034) : Color(0xFFD9D9D9),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                elevation: 0,
              ),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _phoneFocusNode.dispose();
    super.dispose();
  }
}