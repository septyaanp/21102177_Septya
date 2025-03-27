import 'package:flutter/foundation.dart';
import 'item.dart';

class CartModel extends ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => _items;

  double get totalPrice =>
      _items.fold(0, (total, item) => total + (item.price * item.quantity));

  void add(Item item) {
    final index = _items.indexWhere((element) => element.id == item.id);
    if (index != -1) {
      _items[index].quantity++;
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  void decreaseQuantity(Item item) {
    final index = _items.indexWhere((element) => element.id == item.id);
    if (index != -1) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  // TAMBAHKAN METHOD BARU INI
  void removeItem(Item item) {
    _items.removeWhere((element) => element.id == item.id);
    notifyListeners();
  }

  // TAMBAHKAN METHOD BARU INI
  void clearAll() {
    _items.clear();
    notifyListeners();
  }
}
