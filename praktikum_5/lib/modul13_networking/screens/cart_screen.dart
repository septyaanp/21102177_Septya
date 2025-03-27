import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';
import '../models/item.dart';
import '../widgets/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Keranjang Belanja"),
        actions: [
          if (cart.items.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _showDeleteAllConfirmationDialog(context),
            ),
        ],
      ),
      body:
          cart.items.isEmpty
              ? const Center(child: Text("Keranjang kosong"))
              : ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  final item = cart.items[index];
                  return CartItemWidget(
                    item: item,
                    onDelete:
                        () => _showDeleteItemConfirmationDialog(context, item),
                  );
                },
              ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Total: Rp ${cart.totalPrice}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            if (cart.items.isNotEmpty)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () => _showDeleteAllConfirmationDialog(context),
                child: const Text("Hapus Semua Item"),
              ),
          ],
        ),
      ),
    );
  }

  void _showDeleteItemConfirmationDialog(BuildContext context, Item item) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Konfirmasi"),
            content: Text("Hapus ${item.name} dari keranjang?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Batal"),
              ),
              TextButton(
                onPressed: () {
                  Provider.of<CartModel>(
                    context,
                    listen: false,
                  ).removeItem(item);
                  Navigator.pop(context);
                },
                child: const Text("Hapus", style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
    );
  }

  void _showDeleteAllConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Konfirmasi"),
            content: const Text(
              "Apakah Anda yakin ingin menghapus semua item dari keranjang?",
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Batal"),
              ),
              TextButton(
                onPressed: () {
                  Provider.of<CartModel>(context, listen: false).clearAll();
                  Navigator.pop(context);
                },
                child: const Text(
                  "Hapus Semua",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
    );
  }
}
