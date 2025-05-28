import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
     final dynamic listProductOrdered;
     CheckoutScreen({super.key, required this.listProductOrdered});
  final List<Map<String, dynamic>> orders = [
    {
      "name": "Coffee Milk",
      "price": 25000,
      "options": "Ice, Regular, Normal Sugar, Normal Ice",
      "quantity": 1,
      "image": "assets/images/coffee.png"
    }
  ];
  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    double totalPrice = widget.orders.fold(0, (sum, item) => sum + item["price"] * item["quantity"]);

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
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                ...widget.orders.map((order) => _buildOrderItem(order)).toList(),
                const SizedBox(height: 12),
                _buildSectionTitle("When do you want order?"),
                _buildTimeOptions(),
                const SizedBox(height: 16),
                _buildListTile("Payment Method", "Gopay (Rp85.000)", () {}),
                const Divider(),
                _buildListTile("Voucher", "no voucher added", () {}),
                const Divider(),
                const SizedBox(height: 16),
                _buildPaymentSummary(totalPrice),
              ],
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
      margin: const EdgeInsets.only(bottom: 12),
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
              order["image"],
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
                        order["name"],
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      "Rp ${order["price"].toStringAsFixed(0)}",
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  order["options"],
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.edit, size: 20, color: Colors.grey),
                    const SizedBox(width: 12),
                    const Icon(Icons.delete_outline, size: 20, color: Colors.grey),
                    const Spacer(),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle_outline, size: 20),
                          onPressed: () {},
                        ),
                        Text(order["quantity"].toString()),
                        IconButton(
                          icon: const Icon(Icons.add_circle_outline, size: 20),
                          onPressed: () {},
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
    return Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
    );
  }

  Widget _buildTimeOptions() {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text("As Soon as Possible"),
          subtitle: const Text("Now - 10 Minute"),
          trailing: const Icon(Icons.radio_button_off),
          onTap: () {},
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text("Later"),
          subtitle: const Text("Schedule Pick Up"),
          trailing: const Icon(Icons.radio_button_off),
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildListTile(String title, String value, VoidCallback onTap) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
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
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Price"),
            Text("Rp${total.toStringAsFixed(0)}"),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Total", style: TextStyle(fontWeight: FontWeight.w600)),
            Text(
              "Rp${total.toStringAsFixed(0)}",
              style: const TextStyle(fontWeight: FontWeight.w600),
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
              "Rp${total.toStringAsFixed(0)}",
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
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
            child: const Text("Checkout"),
          )
        ],
      ),
    );
  }
}
