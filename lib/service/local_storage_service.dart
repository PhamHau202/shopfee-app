import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static const String _keyOrders = 'orders';

  // Add new order to local orders
  static Future<void> addOrder(Map<String, dynamic> order) async {
    final prefs = await SharedPreferences.getInstance();
    final ordersString = prefs.getString(_keyOrders);
    List<Map<String, dynamic>> orders = [];

    if (ordersString != null) {
      orders = List<Map<String, dynamic>>.from(json.decode(ordersString));
    }

    orders.add(order);

    await prefs.setString(_keyOrders, json.encode(orders));
  }

  // get all local orders
  static Future<List<Map<String, dynamic>>> getOrders() async {
    final prefs = await SharedPreferences.getInstance();
    final ordersString = prefs.getString(_keyOrders);
    if (ordersString != null) {
      return List<Map<String, dynamic>>.from(json.decode(ordersString));
    }
    return [];
  }

  // Delete all orders after completeted checkout
  static Future<void> clearOrders() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyOrders);
  }
}
