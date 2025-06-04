import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopfee_app/route/route_constants.dart';

class CheckoutScreen extends StatefulWidget {
  final dynamic listProductOrdered;
  const CheckoutScreen({super.key, required this.listProductOrdered});
  
  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {

  List orders = [];
  int selectedOption = 0;
  TimeOfDay? _selectedTime;
  String txtTimeSelected = "";
  bool isChooseTransferBanking = true;
  List<Map<String, dynamic>> listTransferBank = [
    {
      "id" : 1,
      "name" : "Viettinbank",
      "iconPath" : "/screens/payment/vietinbank.jpg"
    },
    {
      "id" : 2,
      "name" : "Agribank",
      "iconPath" : "/screens/payment/agribank.png"
    },
    {
      "id" : 3,
      "name" : "Vietcombank",
      "iconPath" : "/screens/payment/vietcombank.png"
    },
    {
      "id" : 4,
      "name" : "BIDV",
      "iconPath" : "/screens/payment/bidv.png"
    },
    {
      "id" : 5,
      "name" : "MB",
      "iconPath" : "/screens/payment/mbbank.png"
    }
  ];
  dynamic selectedCard = {
    "cardName" : "",
    "iconPath" : ""
  };
  dynamic selectedVoucher = {
    "icon": "",
      "title": "",
      "subtitle": "",
      "note": "r",
      "available": false,
  };

  @override
    void initState() {
      super.initState();
      orders = widget.listProductOrdered["orders"] ?? [] ;
    }

  double get totalPrice => orders.fold(
          0,
        (sum, item) =>
            sum + ((item["unitPrice"] is int ? item["unitPrice"] : int.tryParse(item["unitPrice"].toString()) ?? 0) 
                * (item["quantity"] is int ? item["quantity"] : int.tryParse(item["quantity"].toString()) ?? 0)),
      );

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          Expanded(
            child: Container(
            color: Colors.white,
            child: ListView(
                padding: const EdgeInsets.all(16),           
                children:[
                  ...orders.map((order) => _buildOrderItem(order)).toList(),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("Add Order", style: const TextStyle(fontWeight: FontWeight.bold)),
                    leading: const Icon(Icons.keyboard_arrow_left),
                    onTap: (){

                    },
                  ),
                 const Divider(height: 2),
                  const SizedBox(height: 4),

                  _buildSectionTitle("When do you want order?"),
                  _buildTimeOptions(),
                  //const SizedBox(height: 16),
                  _buildListTile("Payment Method", " ${isChooseTransferBanking ? listTransferBank[0]["name"] : selectedCard["cardName"]} (${NumberFormat("#,##0", "en_US").format(totalPrice)})", () async{
                    final result =  await Navigator.pushNamed(context, paymentMethodScreenRoute, arguments: {
                                  "totalPrice": totalPrice, "listTransferBank" : listTransferBank, "isChooseTransferBanking" : isChooseTransferBanking,
                                  "selectedCard" : selectedCard
                                },);

                    if (result != null && result is Map<String, dynamic> ) {
                      listTransferBank = result["listTransferBank"];
                      isChooseTransferBanking = result["isChooseTransferBanking"];
                      selectedCard = result["selectedCard"];

                      setState(() {});  
                    }
                  }),
                  const Divider(height: 2),
                  _buildListTile("Voucher", "${selectedVoucher["name"] != "" ? selectedVoucher["title"] : "no voucher added"}", () async{
                    final rs =  await Navigator.pushNamed(context, voucherScreenRoute, arguments: {
                                  "selectedVoucher" : selectedVoucher
                                },);
                     if (rs != null && rs is Map<String, dynamic> ) {
                        selectedVoucher = rs["selectedVoucher"];
                        setState(() {}); 
                     }
                  }),
                  const Divider(height: 2),
                  const SizedBox(height: 16),
                  _buildPaymentSummary(totalPrice),
                ],
              ),
            ),
          ),
          _buildBottomCheckout(totalPrice),
        ],
      ),
    );
  }

  Widget _buildOrderItem(Map<String, dynamic> order) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              order["imagePath"],
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        order["productName"],
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                    Text(
                      "Rp ${order["unitPrice"].toStringAsFixed(0)}",
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  order["note"],
                  style: const TextStyle(fontSize: 13, color: Colors.grey, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                     IconButton(
                        icon: Icon(Icons.edit, size: 20, color: Colors.black),
                        onPressed: () async{
                              final result = await Navigator.pushNamed(
                                context,
                                productDetailScreenRoute,
                                arguments: {
                                  "product": {
                                    'imagePath': order["imagePath"],
                                    'name': order["productName"],
                                    'type': order["type"],
                                    'desc': order["desc"],
                                    'price': order["unitPrice"],
                                    'oldPrice': order["oldPrice"],
                                    'rating': order["rating"],
                                    'numberSelledOnWeek': order["numberSelledOnWeek"],
                                    'note' : order["note"],
                                    "quantity" : order["quantity"]
                                  },
                                  "flgEdit": true,
                                },
                              );

                              if (result != null && result is Map<String, dynamic>) {
                                setState(() {});  
                              }
                            },
                    ),
                    const SizedBox(width: 8),
                     IconButton(
                        icon: Icon(Icons.delete_outline, size: 20, color: Colors.red),
                        onPressed: (){
                          
                        },
                     ),
                    const Spacer(),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove_circle_outline, size: 20, color: order["quantity"] == 1 ? Colors.grey : Colors.black),
                          onPressed: order["quantity"] == 1 ? null : () {
                            setState(() {
                              if (order["quantity"] > 1) {
                                order["quantity"]--;
                              }
                            });
                          },
                        ),
                        Text(order["quantity"].toString(), style: TextStyle(color: Colors.black),),
                        IconButton(
                          icon: const Icon(Icons.add_circle_outline, size: 20),
                          onPressed: () {
                            setState(() {
                              order["quantity"]++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
            ),
      subtitle: Text("*We are open from 8:00 to 22:00 "),
    );
  }

  Widget _buildTimeOptions() {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text("As Soon as Possible",style: TextStyle( color: Colors.black, fontWeight: FontWeight.bold)),
          subtitle: const Text("Now - 10 Minute"),
          trailing: Icon(selectedOption == 1 ? Icons.radio_button_checked : Icons.radio_button_off, color: selectedOption == 1 ? Color.fromARGB(255, 95, 59, 241) : Color(0xFF5C4033)),
          onTap: () {
            setState(() {
              selectedOption = 1;
            });
          },
        ),
        const Divider(height: 2),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text("Later",style: TextStyle( color: Colors.black, fontWeight: FontWeight.bold)),
          subtitle: Text("Schedule Pick Up ($txtTimeSelected)"),
          trailing: Icon(selectedOption == 2 ? Icons.radio_button_checked : Icons.radio_button_off, color: selectedOption == 2 ? Color.fromARGB(255, 95, 59, 241) : Color(0xFF5C4033) ),
          onTap: () async{
            final selectedTime = await _showTimePicker(context, _selectedTime);
            if (selectedTime != null) {
              setState(() {
                selectedOption = 2;
                _selectedTime = selectedTime;
                int displayHour = selectedTime.hour % 12;
                if (displayHour == 0 && selectedTime.period == DayPeriod.pm) displayHour = 0;
                txtTimeSelected = "${displayHour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')} ${selectedTime.period == DayPeriod.am ? 'AM' : 'PM'}";
              });
            }
          },
        ),
        const Divider(height: 2),
      ],
    );
  }

  Widget _buildListTile(String title, String value, VoidCallback onTap) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(value),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: onTap,
    );
  }

  Widget _buildPaymentSummary(double total) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Payment Summary",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Price", style: TextStyle( color: Colors.black)),
            Text("Rp${NumberFormat("#,##0", "en_US").format(total)}",style: TextStyle( color: Colors.black)),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Total", style: TextStyle(color: Colors.black)),
            Text(
              "Rp${NumberFormat("#,##0", "en_US").format(total)}",
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomCheckout(double total) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey, width: 0.3)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Rp${NumberFormat("#,##0", "en_US").format(total)}",
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w900, color: Colors.black),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF5C4033),
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            onPressed: () {},
            child: const Text("Checkout", style: TextStyle(color: Colors.white),),
          )
        ],
      ),
    );
  }

  Future<TimeOfDay?> _showTimePicker(BuildContext context,  TimeOfDay? selectedTime) async {
    return await showDialog<TimeOfDay>(
      context: context,
      builder: (context) {
        int selectedHour = 0;
        int selectedMinute = 0;
        bool isAm = true;

        if(selectedTime != null)
        {
          isAm = selectedTime.period == DayPeriod.am;
          selectedHour = selectedTime.hour;
          selectedMinute = selectedTime.minute;
          if (isAm && selectedHour == 12) selectedHour -= 12;
          if (!isAm && selectedHour >= 12) selectedHour -= 12;
        }else{
          TimeOfDay now = TimeOfDay.now();
          isAm = now.period == DayPeriod.am;
          selectedHour = now.hour;
          selectedMinute = (now.minute / 5).ceil() * 5;

          if (isAm && selectedHour == 12) selectedHour -= 12;
          if (!isAm && selectedHour >= 12) selectedHour -= 12;

          if (selectedMinute == 60) {
            selectedMinute = 0;
            selectedHour = (selectedHour + 1) % 24;
          }
        }

        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              backgroundColor: Colors.white,
              child: SizedBox(
                height: 320,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Time picker section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 80,
                          height: 150,
                          child: CupertinoPicker(
                            itemExtent: 40,
                            scrollController: FixedExtentScrollController(initialItem: selectedHour),
                            onSelectedItemChanged: (index) {
                              setState(() {
                                selectedHour = index;
                              });
                            },
                            children: List.generate(12, (index) => Center(child: Text(index.toString().padLeft(2, '0')))),
                          ),
                        ),
                        const Text(":", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: 80,
                          height: 150,
                          child: CupertinoPicker(
                            itemExtent: 40,
                            scrollController: FixedExtentScrollController(initialItem: selectedMinute ~/ 5),
                            onSelectedItemChanged: (index) {
                              setState(() {
                                selectedMinute = index * 5;
                              });
                            },
                            children: List.generate(12, (index) => Center(child: Text((index * 5).toString().padLeft(2, '0')))),
                          ),
                        ),

                        const SizedBox(width: 12),
                        // AM/PM Toggle
                        Container(
                          width: 60,
                          height: 110,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () => setState(() {
                                  isAm = true;
                                }),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: isAm ? const Color(0xFF5C4033) : Colors.transparent,
                                    borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                                  ),
                                  child: Text(
                                    "AM",
                                    style: TextStyle(
                                      color: isAm ? Colors.white : Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () => setState(() {
                                  isAm = false;
                                }),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: !isAm ? const Color(0xFF5C4033) : Colors.transparent,
                                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(8)),
                                  ),
                                  child: Text(
                                    "PM",
                                    style: TextStyle(
                                      color: !isAm ? Colors.white : Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          child: const Text("Cancel", style: TextStyle(color: Color(0xFF5C4033))),
                          onPressed: () => Navigator.pop(context),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: const Color(0xFF5C4033),                          
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                          ),
                          child: const Text("Continue"),
                          onPressed: () {
                            // Convert to 24h format based on AM/PM selection
                            int finalHour = selectedHour;
                            if (isAm && finalHour >= 12) finalHour -= 12;
                            if (!isAm && finalHour < 12) finalHour += 12;

                            Navigator.pop(
                              context,
                              TimeOfDay(hour: finalHour, minute: selectedMinute),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }




}
