import 'package:flutter/material.dart';

class VoucherScreen extends StatefulWidget {
  final dynamic selectedVoucher;
  const VoucherScreen({super.key, required this.selectedVoucher});

  @override
  State<VoucherScreen> createState() => _VoucherScreenState();
}

class _VoucherScreenState extends State<VoucherScreen> {
  int selectedVoucherIndex = -1;
  Map<String, dynamic>  selectedVoucher = {};

  final List<Map<String, dynamic>> voucherList = [
    {
      "icon": "/screens/voucher/icon_voucher.png",
      "title": "Disc 10% up to Rp20.000",
      "subtitle": "No minimum purchase",
      "available": true,
    },
    {
      "icon": "/screens/voucher/icon_voucher.png",
      "title": "Disc 15% up to Rp25.000",
      "subtitle": "Minimum spend Rp20.000",
      "available": true,
    },
    {
      "icon": "/screens/voucher/bca_voucher.png",
      "title": "Disc Rp75.000",
      "subtitle": "Minimum spend Rp280.000",
      "note": "Spend another Rp100.000 to enjoy this voucher",
      "available": false,
    },
    {
      "icon": "/screens/voucher/bsi_voucher.png",
      "title": "Disc Rp20.000",
      "subtitle": "Minimum spend Rp80.000",
      "note": "Spend another Rp60.000 to enjoy this voucher",
      "available": false,
    },
    {
      "icon": "/screens/voucher/expired_voucher.png",
      "title": "Disc Rp20.000",
      "subtitle": "Minimum spend Rp80.000",
      "note": "Spend another Rp60.000 to enjoy this voucher",
      "available": false,
    },
    {
      "icon": "/screens/voucher/expired_voucher.png",
      "title": "Disc Rp40.000",
      "subtitle": "Minimum spend Rp80.000",
      "note": "Spend another Rp50.000 to enjoy this voucher",
      "available": false,
    },    
    {
      "icon": "/screens/voucher/expired_voucher.png",
      "title": "Disc Rp20.000",
      "subtitle": "Minimum spend Rp80.000",
      "note": "Spend another Rp60.000 to enjoy this voucher",
      "available": false,
    },
    {
      "icon": "/screens/voucher/expired_voucher.png",
      "title": "Disc Rp40.000",
      "subtitle": "Minimum spend Rp80.000",
      "note": "Spend another Rp50.000 to enjoy this voucher",
      "available": false,
    },
    {
      "icon": "/screens/voucher/expired_voucher.png",
      "title": "Disc Rp20.000",
      "subtitle": "Minimum spend Rp80.000",
      "note": "Spend another Rp60.000 to enjoy this voucher",
      "available": false,
    },
    {
      "icon": "/screens/voucher/expired_voucher.png",
      "title": "Disc Rp40.000",
      "subtitle": "Minimum spend Rp80.000",
      "note": "Spend another Rp50.000 to enjoy this voucher",
      "available": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back, color: Colors.black)) ,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Voucher",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Enter the voucher code here",
                border: InputBorder.none,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: voucherList.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final voucher = voucherList[index];
                final isSelected = index == selectedVoucherIndex;

                return ListTile(
                  enabled: voucher["available"],
                  leading: Image.asset(
                    voucher["icon"],
                    width: 36,
                    height: 36,
                   // color: voucher["available"] ? null : Colors.grey.shade400,
                  ),
                  title: Text(
                    voucher["title"],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: voucher["available"]
                          ? Colors.black
                          : Colors.grey.shade400,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        voucher["subtitle"],
                        style: TextStyle(
                          color: voucher["available"]
                              ? Colors.black54
                              : Colors.grey.shade400,
                        ),
                      ),
                      if (voucher.containsKey("note"))
                        Text(
                          voucher["note"],
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                    ],
                  ),
                  trailing: voucher["available"]
                      ? Radio(
                          activeColor: Colors.brown,
                          value: index,
                          groupValue: selectedVoucherIndex,
                          onChanged: (value) {
                            setState(() {
                              selectedVoucherIndex = value!;
                            });
                          },
                        )
                      : null,
                  onTap: voucher["available"]
                      ? () {
                          setState(() {
                            selectedVoucherIndex = index;
                            selectedVoucher = voucherList[index];
                          });
                        }
                      : null,
                );
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "1 voucher selected",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, { "selectedVoucher" : selectedVoucher});
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF5D4037),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                "Accept",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
