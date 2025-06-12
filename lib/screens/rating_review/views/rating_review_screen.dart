import 'package:flutter/material.dart';

class RatingReviewScreen extends StatelessWidget {
  final int orderId;
  final int productId;

  const RatingReviewScreen({
    super.key,
    required this.orderId,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rating & Review'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Order ID: $orderId'),
            Text('Product ID: $productId'),
            // Add your rating and review UI here
          ],
        ),
      ),
    );
  }
} 