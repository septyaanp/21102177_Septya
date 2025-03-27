import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';
import '../models/item.dart';

class CartItemWidget extends StatelessWidget {
  final Item item;

  const CartItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                item.icon,
                size: 28,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _formatCurrency(item.price),
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            QuantityController(item: item),
          ],
        ),
      ),
    );
  }

  String _formatCurrency(double price) {
    return 'Rp ${price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}';
  }
}

class QuantityController extends StatelessWidget {
  final Item item;

  const QuantityController({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder:
          (context, cart, child) => Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove, size: 20),
                onPressed: () => cart.decreaseQuantity(item),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text("${item.quantity}"),
              ),
              IconButton(
                icon: const Icon(Icons.add, size: 20),
                onPressed: () => cart.add(item),
              ),
            ],
          ),
    );
  }
}
