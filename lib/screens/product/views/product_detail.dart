import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final dynamic product;
  final void Function()? onAddToCart;

  const ProductDetailScreen({super.key, required this.product, this.onAddToCart});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;
  String variant = "Ice";
  String size = "Regular";
  String sugar = "Normal";
  String ice = "Normal";

  double price = 25000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Customize Order',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            color: const Color(0xFFFFFFFF),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      height: 332,
                      width: double.infinity,
                      child: Image.asset(
                        widget.product["imagePath"],
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),

          // Product Info Card (overlap)
          Positioned(
            top: 312,
            left: 25,
            right: 25,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.product["type"], style: const TextStyle(color: Colors.black)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.product["name"],
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                      ),
                      Text(
                        "Rp${widget.product["price"].toStringAsFixed(0)}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                        Expanded(
                          child: Text(widget.product["desc"], style: const TextStyle(color: Colors.black)),
                        ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          setState(() {
                            if (quantity > 1) quantity--;
                          });
                        },
                      ),
                      Text(quantity.toString(), style: const TextStyle(fontSize: 16)),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline),
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 18),
                      const SizedBox(width: 4),
                      Text("${widget.product["rating"]} (23)  •  Ratings and reviews"),
                      ],
                  )
                ],
              ),
            ),
          ),

    // Scrollable content dưới info card
    Positioned(
      top: 512, // 332 (image) + 20 (overlap) + card height (160) => adjust theo thực tế
      left: 0,
      right: 0,
      bottom: 70, // chừa chỗ cho footer
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Customize", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 16),
            buildOptionRow("Variant", ["Ice", "Hot"], variant, (val) {
              setState(() {
                variant = val;
              });
            }),
            buildOptionRow("Size", ["Regular", "Medium", "Large"], size, (val) {
              setState(() {
                size = val;
              });
            }),
            buildOptionRow("Sugar", ["Normal", "Less"], sugar, (val) {
              setState(() {
                sugar = val;
              });
            }),
            buildOptionRow("Ice", ["Normal", "Less"], ice, (val) {
              setState(() {
                ice = val;
              });
            }),
            const SizedBox(height: 24),
          ],
        ),
      ),
    ),

    // Footer
    Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.black12)),
        ),
        child: Row(
          children: [
            Text(
              "Rp ${(price * quantity).toStringAsFixed(0)}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                backgroundColor: const Color(0xFF402218),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text("Add Order", style: TextStyle(fontSize: 16, color: Colors.white)),
            )
          ],
        ),
      ),
    ),
      ],
    ),
    );
  }

  Widget buildOptionRow(
    String title,
    List<String> options,
    String selected,
    Function(String) onSelected,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: options.map((option) {
            final isSelected = selected == option;
            return GestureDetector(
              onTap: () => onSelected(option),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF402218) : Colors.grey[200],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  option,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
