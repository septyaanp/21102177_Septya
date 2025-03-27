import 'package:flutter/material.dart';

class Item {
  final int id;
  final String name;
  final double price;
  final IconData icon;
  int quantity;

  Item({
    required this.id,
    required this.name,
    required this.price,
    required this.icon,
    this.quantity = 1,
  });
}
