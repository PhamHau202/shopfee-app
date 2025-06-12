import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final dynamic product;
  final bool flgEdit;

  const ProductDetailScreen({super.key, required this.product, required this.flgEdit});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;
  final noteRegex = RegExp(r"^(.*?), (.*?), Sugar: (.*?), Ice: (.*)$");
  String variant = "Ice";
  String size = "Regular";
  String sugar = "Normal";
  String ice = "Normal";

  @override
  void initState() {
    super.initState();
    quantity = widget.product.containsKey("quantity") ? widget.product["quantity"] : 1;
    
    if(widget.product.containsKey("note"))
    {
      final match = noteRegex.firstMatch(widget.product["note"]);
      if (match != null) {
        variant = match.group(1)!;
        size = match.group(2)!;
        sugar = match.group(3)!;
        ice = match.group(4)!;
      }
    }
  }

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
            top: 292,
            left: 20,
            right: 20,
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
                  Row(
                    children: [
                      Expanded(
                        child: Text(widget.product["type"], style: const TextStyle(color: Colors.black)),
                      ),
                      if(widget.product["oldPrice"] != null)
                        Text(
                        "Rp ${widget.product["oldPrice"].toStringAsFixed(0)}",
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey, decoration: TextDecoration.lineThrough,),
                      )
                    ],
                  ),
                  
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
                        "Rp ${widget.product["price"].toStringAsFixed(0)}",
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
                      //const Spacer(),
                      IconButton(
                        icon: Icon(Icons.remove_circle_outline, color : quantity == 1 ? Colors.grey : Colors.black),
                        onPressed: quantity == 1 ? null : () {
                          setState(() {
                            if (quantity > 1) quantity--;
                          });
                        },
                      ),
                      Text(quantity.toString(), style: const TextStyle(fontSize: 16, color: Colors.black)),
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
                      const Spacer(),
                      const Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 20),
                      ],
                  )
                ],
              ),
            ),
          ),

          Positioned(
            top: 460, 
            left: 20,
            right: 20,
            bottom: 70, // footer
            child: Container(
             padding: const EdgeInsets.only(top: 10, bottom: 8, right: 10, left: 10),
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
                    const Text("Customize", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
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
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.black12)),
              ),
              padding: EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Total", style: TextStyle(color: Colors.black, fontSize: 14)),
                      const SizedBox(height: 4),
                      Text("Rp ${(widget.product["price"] * quantity).toStringAsFixed(0)}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                            ),
                          ),
                        ]
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          final orderDetail = {
                            "productName": widget.product["name"],
                            "quantity": quantity,
                            "unitPrice": widget.product["price"],
                            "note": "$variant, $size, Sugar: $sugar, Ice: $ice",
                            "subTotal": quantity * widget.product["price"],
                            "imagePath" : widget.product["imagePath"],
                            "type" : widget.product["type"],
                            "oldPrice": widget.product["oldPrice"],
                            "desc" : widget.product["desc"],
                            "rating" : widget.product["rating"]
                          };

                          Navigator.pop(context, orderDetail);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                          backgroundColor: const Color(0xFF402218),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
        Row( 
          children: [
            Expanded(
              child: Text(title, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black)),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              runSpacing: 8,
              children: options.map((option) {
                final isSelected = selected == option;
                return GestureDetector(
                  onTap: () => onSelected(option),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFF402218) : Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      option,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,  fontSize: 12,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
