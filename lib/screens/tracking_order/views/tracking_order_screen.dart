import 'package:flutter/material.dart';
import 'package:shopfee_app/route/route_constants.dart';

class TrackingOrderScreen extends StatefulWidget {
  final dynamic receiptOrder;

  const TrackingOrderScreen({super.key, required this.receiptOrder});

  @override
  State<TrackingOrderScreen> createState() => _TrackingOrderScreenState();
}

class _TrackingOrderScreenState extends State<TrackingOrderScreen> {
  int statusStep = 2; // 0: received, 1: preparing, 2: complete
  dynamic order;
  List<String> statusTitles = [
    "Coffee shop takes your order",
    "Prepare your order",
    "Your order is complete. Please pick it up at the bar"
  ];

  @override
  void initState() {
    super.initState();
    order = widget.receiptOrder["items"] ?? [];
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        // Here you can update statusStep based on real data
        // For example, if the order is complete, set statusStep to 2
      });
    });
  }

 void showTrackingOrderSuccess(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      Future.delayed(Duration(seconds: 5), () {
        Navigator.of(context).pop(); 
        Navigator.pushReplacementNamed(
          context,
          ratingReviewScreenRoute,
          arguments: {
            "orderId": 11,
            "productId": 2,
          },
        );
      });

      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,  // quan trọng
            children: [
              Image.asset('/images/input/img_success.gif', height: 120),
              const SizedBox(height: 24),
              Text(
                "Yeayy!!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Your order is complete\nYou can pick it up at the bar",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tracking Orders"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  ...order.map<Widget>((item) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              item["imagePath"],
                              width: 50,
                              height: 50,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item["productName"], style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black)),
                                  const SizedBox(height: 4),
                                  Text(item["note"], style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey[600], fontSize: 14)),
                                ]
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(item["unitPrice"].toString(), style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                                Text("x ${item["quantity"].toString()}", style: TextStyle(color: Colors.grey[600], fontSize: 14))
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                      ]
                    );
                  }).toList(),

                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => ReceiptOrderScreen(),
                      //   ),
                      // );
                    },
                    child: Row(
                      children: [
                        Text("Receipt Order", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black)),
                        const Spacer(),
                        Icon(Icons.arrow_forward_ios, size: 14)
                      ],
                    ),
                  ),
                  const Divider(height: 32),
                  // Tracking step
                  Column(
                    children: List.generate(statusTitles.length, (index) {
                      final isFinalStep = 2 == index;
                      final isCompleted = index <= statusStep;
                      final isLast = index == statusTitles.length - 1;

                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 30,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: isCompleted ? Colors.green : Colors.white,
                                    border: Border.all(
                                        color: isCompleted ? Colors.green : Colors.grey,
                                        width: 2),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    isCompleted ? Icons.check : Icons.circle_outlined,
                                    size: isFinalStep ? 20 : 12,
                                    color: isCompleted ? Colors.white : Colors.grey,
                                  ),
                                ),
                                // Line
                                if (!isLast)
                                  Container(
                                    width: 2,
                                    height: 50, 
                                    color: Colors.green,
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(statusTitles[index], style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 16)),
                                  if (index == 2)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: widget.receiptOrder["schedulePickUp"] != "" 
                                          ? Text(
                                              "Schedule Pick Up ${widget.receiptOrder["schedulePickUp"]}",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey[600]),
                                            )
                                          : SizedBox.shrink(),
                                    ),
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: statusStep == 2
                        ? () {
                            showTrackingOrderSuccess(context);
                            setState(() {
                              statusStep = 3; // Update to indicate order is complete
                            });
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: statusStep == 2
                          ? Color(0xFF5B4034)
                          : Colors.grey[400],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      elevation: 0,
                    ),
                    child: Text("Take Order"),
                  ),
                ),
                if (statusStep == 2)
                  const SizedBox(height: 8),
                if (statusStep == 2)
                  Text(
                    "Take order when you have received your order.",
                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
