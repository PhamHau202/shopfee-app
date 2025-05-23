import 'package:flutter/material.dart';

class PupularProducts extends StatelessWidget {
  final String image;
  final String name;
  final String desc;
  final double price;
  final double? oldPrice;
  final double rating;

  const PupularProducts({
    super.key,
    required this.image,
    required this.name,
    required this.desc,
    required this.price,
    this.oldPrice,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(image, width: 50, height: 50, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(desc, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                Row(
                  children: [
                    const Icon(Icons.star, size: 14, color: Colors.amber),
                    Text(rating.toString(), style: const TextStyle(fontSize: 12))
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Rp${price.toStringAsFixed(0)}", style: const TextStyle(fontWeight: FontWeight.bold)),
              if (oldPrice != null)
                Text(
                  "Rp${oldPrice!.toStringAsFixed(0)}",
                  style: const TextStyle(
                    fontSize: 12,
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                  ),
                ),
            ],
          ),
          const Padding(padding: EdgeInsets.only(bottom: 8),)
        ],
      ),
    );
  }
}
