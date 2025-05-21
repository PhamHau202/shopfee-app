import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? number_phone;

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();

  @override
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
                'Name',
                style: TextStyle(
                  // fontWeight: FontWeight.w800,
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          TextFormField(
            focusNode: _nameFocusNode,
            decoration: InputDecoration(
              hintText: _nameFocusNode.hasFocus ? '' : 'Input your name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Input your name';
              }
              return null;
            },
            onSaved: (value) {
              name = value;
            },
            onTap: () {
              setState(() {});
            },
            onChanged: (value) {
              setState(() {});
            },
          ),
          const SizedBox(height: 12),
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
            focusNode: _phoneFocusNode,
            decoration: InputDecoration(
              hintText: _phoneFocusNode.hasFocus ? '' : 'Input your No. Handphone',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
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
              setState(() {});
            },
          ),          
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _phoneFocusNode.dispose();
    super.dispose();
  }
}