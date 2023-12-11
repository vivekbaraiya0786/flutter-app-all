import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class product_Provider extends ChangeNotifier {
  loadData() async {
    String data =
        await rootBundle.loadString('Assets/product_app/product.json');
  }
}
