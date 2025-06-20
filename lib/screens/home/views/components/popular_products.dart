import 'dart:convert';

import 'package:flutter/material.dart';

class PopularProducts extends StatelessWidget {
  final String image;
  final String name;
  final String desc;
  final double price;
  final double? oldPrice;
  final double rating;
  //final int numberSelledOnWeek;

  const PopularProducts({
    super.key,
    required this.image,
    required this.name,
    required this.desc,
    required this.price,
    this.oldPrice,
    required this.rating,
    //required this.numberSelledOnWeek,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: image.isEmpty
                ? Image.asset('/icons/default_img.jpg', width: 50, height: 60, fit: BoxFit.cover)
                : Image.memory(base64Decode(image.split(',').last), width: 50, height: 60, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "${price.toStringAsFixed(0)}₫",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                        ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        desc,
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (oldPrice != null)
                      Text(
                        "${oldPrice!.toStringAsFixed(0)}₫",
                        style: const TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(rating.toString(), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
                    const Icon(Icons.star, size: 14, color: Colors.amber),
                  ],
                ),
              ],
            ),
          ),
          
          const Padding(padding: EdgeInsets.only(bottom: 8),)
        ],
      ),
    );
  }
}
