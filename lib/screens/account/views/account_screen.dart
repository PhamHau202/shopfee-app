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
      appBar: AppBar(
        title: const Text("Account"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // search bar
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text("Account"),
            ),
            // scroll container
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Thêm product list hoặc grid ở đây
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
