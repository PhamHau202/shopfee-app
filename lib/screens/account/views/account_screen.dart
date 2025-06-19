import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back, color: Colors.black)),
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Edit',
              style: TextStyle(
                color: Color(0xFF7F4FFB),
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundImage: AssetImage('/icons/account.png'),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sepide Moqadasi',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Sepide@piqo.design',
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),
            buildInfoRow('Name', 'Sepide'),
            buildInfoRow('Date of birth', 'Oct 31, 1997'),
            buildInfoRow('Phone number', '+1–202–555–0162'),
            buildInfoRow('Gender', 'Female'),
            buildInfoRow('Email', 'Sepide@piqo.design'),
            buildInfoRow('Password', '', isPassword: true),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(String label, String value, {bool isPassword = false}) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              isPassword
                  ? TextButton(
                      onPressed: () {},
                      child: Text(
                        'Change Password',
                        style: TextStyle(
                          color: Color(0xFF7F4FFB),
                          fontSize: 14,
                        ),
                      ),
                    )
                  : Text(
                      value,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
            ],
          ),
        ),
        Divider(height: 1, color: Colors.black12),
      ],
    );
  }
}
