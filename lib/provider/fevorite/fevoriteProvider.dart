import 'package:exporter/data_model/productModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FevoriteProvider extends ChangeNotifier {
  final List<Product> _fevorite = [];
  List<Product> get fevorite => _fevorite;
  void toggleFevorite(Product product) {
    if (_fevorite.contains(product)) {
      fevorite.remove(product);
    } else {
      _fevorite.add(product);
    }
    notifyListeners();
  }

  bool isExist(Product product) {
    final isExist = _fevorite.contains(product);

    return isExist;
  }

  static FevoriteProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<FevoriteProvider>(context, listen: listen);
  }
}
