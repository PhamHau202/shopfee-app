import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}
  class _HistoryScreenState extends State<HistoryScreen> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // search bar 
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text("History"),
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