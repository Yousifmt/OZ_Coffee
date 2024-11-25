import 'package:stacked/stacked.dart';
import 'package:ozcoffee/models/menu.dart';
import 'package:ozcoffee/models/cart_model.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CartViewModel extends BaseViewModel {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => List.unmodifiable(_cartItems);

  double get totalPrice => _cartItems.fold(
        0.0,
        (sum, item) => sum + (double.parse(item.menu.price) * item.quantity),
      );

  Future<void> _saveCartToDevice() async {
    final prefs = await SharedPreferences.getInstance();
    final cartData = _cartItems.map((item) {
      return {
        'menu': {
          'name': item.menu.name,
          'price': item.menu.price,
          'imagePath': item.menu.imagePath,
          'description': item.menu.description,
          'category': item.menu.category,
        },
        'quantity': item.quantity,
      };
    }).toList();
    await prefs.setString('cartItems', jsonEncode(cartData));
  }

  Future<void> loadCartFromDevice() async {
    final prefs = await SharedPreferences.getInstance();
    final cartData = prefs.getString('cartItems');
    if (cartData != null) {
      final decodedData = jsonDecode(cartData) as List<dynamic>;
      _cartItems.clear();
      for (var item in decodedData) {
        final menu = Menu(
          name: item['menu']['name'],
          price: item['menu']['price'],
          imagePath: item['menu']['imagePath'],
          description: item['menu']['description'],
          category: item['menu']['category'],
        );
        _cartItems.add(CartItem(menu: menu, quantity: item['quantity']));
      }
      notifyListeners();
    }
  }

  void addMultipleItemsToCart(Menu menu, int quantity) {
    final existingItem = _cartItems.firstWhere(
      (item) => item.menu.name == menu.name,
      orElse: () => CartItem(menu: menu),
    );

    if (_cartItems.contains(existingItem)) {
      existingItem.quantity += quantity;
    } else {
      _cartItems.add(CartItem(menu: menu, quantity: quantity));
    }

    notifyListeners();
    _saveCartToDevice();
  }

  void removeItemFromCart(Menu menu) {
    _cartItems.removeWhere((item) => item.menu.name == menu.name);
    notifyListeners();
    _saveCartToDevice();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
    _saveCartToDevice();
  }

  void updateCartItemQuantity(Menu menu, int newQuantity) {
    final index = _cartItems.indexWhere((item) => item.menu == menu);
    if (index != -1) {
      _cartItems[index].quantity = newQuantity;
      notifyListeners();
      _saveCartToDevice();
    }
  }
}
