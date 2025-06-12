import 'package:flutter/material.dart';
import 'package:shopfee_app/route/route_constants.dart';

class TransactionScreen extends StatefulWidget {
  final dynamic receiptOrder;
  const TransactionScreen({super.key, required this.receiptOrder});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  String transactionState = ''; // loading, success, receipt
  String errorMessage = '';
  //dynamic receiptOrderDetail;
  
@override
void initState() {
  super.initState();
  startTransaction();
}

  Future<void> startTransaction() async {
    setState(() {
      transactionState = 'loading';
      errorMessage = '';
    });

    try {
      bool result = await handleTransactionApi();
      if (result) {
        await Future.delayed(Duration(seconds: 3));
        setState(() {
          transactionState = 'success';
        });

        await Future.delayed(Duration(seconds: 3));

        setState(() {
          transactionState = 'receipt';
        });
      } else {
        setState(() {
          transactionState = 'error';
          errorMessage = 'Transaction failed. Please try again.';
        });
      }
    } catch (e) {
      setState(() {
        transactionState = 'error';
        errorMessage = e.toString();
      });
    }
  }

  // Giả lập API banking trả về true/false
  Future<bool> handleTransactionApi() async {
    await Future.delayed(Duration(seconds: 3));

    // Random kết quả success / fail
    bool isSuccess = true;
    return isSuccess;
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyContent = Center();

    if (transactionState == 'loading') {
      bodyContent = 
       Scaffold(
        body: 
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('/images/input/img_loading.gif', ),
              ],
            ),
          )
       );
    } else if (transactionState == 'success') {
      bodyContent = 
      Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('/images/input/img_success.gif', ),
              SizedBox(height: 30),
              Text("Yeayy!!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text("Your Transaction was successful"),
              SizedBox(height: 10),
              Text("Coffee shop takes your order"),
            ],
          ),
        )
      );
    } else if (transactionState == 'receipt') {
      bodyContent = 
        Scaffold(
          appBar: AppBar(title: Text("Receipt Order", style: TextStyle(color: Colors.black),)),
          body: SafeArea(
            child: Column(
              children: [
              
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(24),
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topCenter,
                      children: [                        
                        Container(
                          margin: EdgeInsets.only(top: 40),
                          padding: EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 30),
                              Text(
                                "Thank you!",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Your transaction was successful",
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(height: 30),
                              buildReceiptInfo(),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),

                        // Icon nổi
                        Positioned(
                          top: 0,
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.15),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.check, size: 40, color: Colors.green),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                  child: SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          transactionState = 'idle';
                        });
                        Navigator.pushNamed(context, trackingOrderScreenRoute, arguments: {
                          "receiptOrder" : widget.receiptOrder
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF5B4034),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        elevation: 0,
                      ),
                      child: Text("Tracking Order", style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ),
              ],
            ),
          ),

        );
    }

    return bodyContent;
  }

  Widget buildReceiptInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildInfoRow("ID Transaction", "D123456789ABC", true),
        buildInfoRow("Date", "10 July'22", true),
        buildInfoRow("Time", "04:13 PM", true),
        SizedBox(height: 10),
        Divider(),
        Text("Item", style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black)),
        SizedBox(height: 5),
        ...widget.receiptOrder["items"].expand((item) {
              final List<Widget> widgets = [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Text(item["productName"], style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),),
                                                  ),
                                                  Text("x${item["quantity"]}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),),
                                                ],
                                              ),
                                            ];

              
              final note = item["note"]?.toString() ?? '';
              if (note.trim().isNotEmpty) {
                widgets.add(Text(note, style: TextStyle(color: Colors.black)));
                widgets.add(SizedBox(height: 5));
              }
              
              return widgets;
          }),
        
        SizedBox(height: 10),
        
        Text("Payment Summary", style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black)),
        SizedBox(height: 10), 
        buildInfoRow("Price", widget.receiptOrder["price"].toString(), false),
        buildInfoRow(
          "Voucher",
          widget.receiptOrder["voucher"] != null
              ? "${widget.receiptOrder["voucher"].toString()}%"
              : "",
          false,
        ),
        buildInfoRow("Total", widget.receiptOrder["total"].toString(), true),
        SizedBox(height: 10),
        Divider(),
       buildInfoRow("Payment Method", widget.receiptOrder["paymentMethod"], true),
       buildInfoRow("Schedule Pick Up", widget.receiptOrder["schedulePickUp"], true),
      ],
    );
  }

  Widget buildInfoRow(String label, String value, [bool isFwBold = false]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: isFwBold ? FontWeight.w700 : FontWeight.normal, color: Colors.black),),
          Text(value, style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
