import 'package:exporter/data_model/productModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];
  List<Product> get cart => _cart;
  void toggleFevorite(Product product) {
    if (_cart.contains(product)) {
      for (Product element in _cart) {
        element.quantity++;
      }
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }

  increamentQtn(int index) => _cart[index].quantity++;

  decrementQtn(int index) {
    if (_cart[index].quantity > 0) {
      _cart[index].quantity--;
    }
  }

  totalPrice() {
    double totalprice = 0.0;
    for (Product element in _cart) {
      totalprice += element.price * element.quantity;
    }
    return totalprice;
  }

  static CartProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<CartProvider>(context, listen: listen);
  }
}
