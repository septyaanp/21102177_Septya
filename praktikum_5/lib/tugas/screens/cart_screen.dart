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
        title: const Text("Keranjang Saya"),
        actions: [
          if (cart.items.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () => _showDeleteAllDialog(context),
            ),
        ],
      ),
      body: _buildBody(context, cart),
    );
  }

  Widget _buildBody(BuildContext context, CartModel cart) {
    if (cart.items.isEmpty) {
      return _buildEmptyCart();
    }
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              final item = cart.items[index];
              return Dismissible(
                key: Key(item.id.toString()),
                background: _buildDismissibleBackground(),
                onDismissed: (direction) => _handleDismiss(context, cart, item),
                child: CartItemWidget(item: item),
              );
            },
          ),
        ),
        _buildTotalSection(context, cart),
      ],
    );
  }

  Widget _buildDismissibleBackground() {
    return Container(
      color: Colors.red.shade100,
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 20),
      child: const Icon(Icons.delete, color: Colors.red),
    );
  }

  void _handleDismiss(BuildContext context, CartModel cart, Item item) {
    cart.removeItem(item);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('🗑️ ${item.name} dihapus'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Widget _buildEmptyCart() {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 100, color: Colors.grey),
          SizedBox(height: 20),
          Text("Keranjang Kosong"),
          SizedBox(height: 8),
          Text("Ayo tambahkan produk menarik!"),
        ],
      ),
    );
  }

  Widget _buildTotalSection(BuildContext context, CartModel cart) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ), // Tanda kurung penutup yang ditambahkan
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Total"),
              Text(
                'Rp ${cart.totalPrice.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {},
              child: const Text("Checkout"),
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteAllDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Hapus Semua?"),
            content: const Text("Yakin ingin mengosongkan keranjang?"),
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
                child: const Text("Hapus", style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
    );
  }
}
