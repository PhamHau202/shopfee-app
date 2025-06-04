import 'package:flutter/material.dart';

class CreditCardList extends StatelessWidget {

  const CreditCardList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cardList = [
      {
      "cardName": "Momo",
      //"cardNumber": "**** **** **** 1234",
      "iconPath": "/screens/payment/momo_wallet.png"
    },
    {
      "cardName": "Visa Platinum",
      //"cardNumber": "**** **** **** 1234",
      "iconPath": "/screens/payment/visa.png"
    },
    {
      "cardName": "Mastercard Gold",
      //"cardNumber": "**** **** **** 5678",
      "iconPath": "/screens/payment/mastercard.jpg"
    },
    {
      "cardName": "Zalo Pay",
      //"cardNumber": "**** **** **** 9101",
      "iconPath": "/screens/payment/zalopay.png"
    }
    ,
    {
      "cardName": "VN Pay",
      //"cardNumber": "**** **** **** 9101",
      "iconPath": "/screens/payment/vnpay.jpg"
    },
  ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Card", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: ListView.separated(
        itemCount: cardList.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final card = cardList[index];
          return ListTile(
            leading: Image.asset(card["iconPath"]!, width: 40, height: 40),
            title: Text(card["cardName"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
            //subtitle: Text(card["cardNumber"]!),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pop(context, card); 
            },
          );
        },
      ),
    );
  }
}
