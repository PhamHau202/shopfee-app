import 'package:flutter/material.dart';
import 'package:shopfee_app/route/route_constants.dart';

class RatingReviewScreen extends StatefulWidget {
  final int orderId;
  final int productId;

  const RatingReviewScreen({
    super.key,
    required this.orderId,
    required this.productId,
  });

  @override
  State<RatingReviewScreen> createState() => _RatingReviewScreenState();
}

class _RatingReviewScreenState extends State<RatingReviewScreen> {
  int selectedRating = 0;
  final TextEditingController reviewController = TextEditingController();
  List<Map<String, dynamic>> orders = [
    {"name": "Coffee Milk", "quantity" : 3, "note" : "Ice, Regular, Normal Sugar, Normal Ice", "price": 230, "imgPath": "/screens/home/coffee/coffee1.jpg", "rating": 0, "review": ""},
    {"name": "Cappuccino", "quantity" : 1, "note" : "Hot, Regular, No Sugar", "price": 250, "imgPath": "/screens/home/coffee/coffee2.jpg", "rating": 0, "review": ""},
  ];

  @override
  void dispose() {
    reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rating and Review", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () {
              Navigator.pushNamed(context, entryPointScreenRoute);
          },
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Image.asset('/screens/rating_review/rating_review.png', height: 200),
            const SizedBox(height: 24),
            Text(
              "How's your order this time?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
            ),
            const SizedBox(height: 24),

            // Rating section
             ...orders.map((item) => buildProductReview(item)).toList(),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Reviews will be visible to the public",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),

            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedRating > 0
                    ? () {
                        // handle send review
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Thanks for your review!")),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedRating > 0
                      ? Color(0xFF5B4034)
                      : Colors.grey[400],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 0,
                ),
                child: Text("Send a review", 
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
              ),
              )
            )
         
               
          ],
        ),
      ),
    );
  }

  Widget buildProductReview(Map<String, dynamic> item) {
    return Container(
      margin: EdgeInsets.only(bottom: 24),
      padding: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(item['imgPath'], width: 60, height: 60, fit: BoxFit.cover),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item['name'], style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black)),
                    SizedBox(height: 4),
                    Text(item['note'], style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Rp. ${item['price']}", style: TextStyle(color: Colors.black, fontSize: 16)),
                  SizedBox(height: 4),
                ],
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Rate this product", style: TextStyle(fontSize: 14, color: Colors.black)),
              SizedBox(height: 4),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [              
              ...List.generate(5, (index) {
                bool isSelected = index < item['rating'];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      item['rating'] = index + 1;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    padding: EdgeInsets.all(6),
                    child: Icon(
                      Icons.star,
                      color: isSelected ? Color(0xFFFFD232) : Colors.grey[400],
                      size: 32,
                    ),
                  ),
                );
              }),
            ]
          ),
          SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(
              hintText: "Tell us about this product...",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
            maxLines: 2,
            onChanged: (value) => item['review'] = value,
          ),
        ],
      ),
    );
  }
}

