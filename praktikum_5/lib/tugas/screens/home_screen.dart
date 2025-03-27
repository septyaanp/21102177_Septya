import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';
import '../models/item.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Item> availableItems = [
    Item(id: 1, name: "Beras Premium", price: 15000000, icon: Icons.grain),
    Item(id: 2, name: "Gula Pasir", price: 250000, icon: Icons.icecream),
    Item(id: 3, name: "Tepung Terigu", price: 500000, icon: Icons.cookie),
    Item(
      id: 4,
      name: "Bumbu Dapur",
      price: 1500000,
      icon: Icons.emoji_food_beverage,
    ),
    Item(id: 5, name: "Minyak Goreng", price: 1500000, icon: Icons.water_drop),
    Item(id: 6, name: "Telur (1kg)", price: 30000, icon: Icons.egg),
    Item(id: 7, name: "Susu Kotak", price: 8000, icon: Icons.local_drink),
    Item(id: 8, name: "Mie Instan", price: 5000, icon: Icons.ramen_dining),
    Item(id: 9, name: "Sabun Mandi", price: 12000, icon: Icons.soap),
    Item(id: 10, name: "Shampoo", price: 25000, icon: Icons.shower),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Septya Mart",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Badge(
            label: Consumer<CartModel>(
              builder: (context, cart, child) => Text("${cart.items.length}"),
            ),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart_rounded),
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartScreen()),
                  ),
            ),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: availableItems.length,
        itemBuilder: (context, index) {
          final item = availableItems[index];
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () => _addToCart(context, item),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Icon(
                        item.icon,
                        size: 48,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _formatCurrency(item.price),
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        FloatingActionButton.small(
                          heroTag: 'add_${item.id}',
                          onPressed: () => _addToCart(context, item),
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _addToCart(BuildContext context, Item item) {
    Provider.of<CartModel>(context, listen: false).add(item);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('✅ ${item.name} ditambahkan'),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  String _formatCurrency(double price) {
    return 'Rp ${price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}';
  }
}
