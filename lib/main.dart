import 'package:e_commerce/prodect.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (c) => cartProvide(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Prodect(),
    );
  }
}

class product {
  final String id;
  final String name;
  final double price;
  bool isFavorite;
  int quantity;
  var  imag;

  product(
      {required this.id,
      required this.name,
      required this.price,
      this.isFavorite = false,
      this.quantity = 1,
      required this.imag
      });
}

class cartProvide extends ChangeNotifier {
  final List<product> _item = [
    product(
      id: '1',
      name: 'hour',
      price: 100.0,
      imag: Image.asset("images/IMG_20221126_195630.jpg"),
    ),
    product(
      id: '2',
      imag: Image.asset("images/coinview-app-h7a6g0ua6LM-unsplash.jpg"),
      name: 'Phone',
      price: 150.00,
    ),
    product(
      id: '3',
      name: 'computert',
      price: 2000,
      imag: Image.asset('images/computer.jpg'),
    ),

    product(
      id: '4',
      name: 'iphone',
      price: 1300,
      imag: Image.asset("images/iphone.jpg"),
    ),
  ];

  List<product> get item => _item;
  List<product> get favorits => _item.where((p) => p.isFavorite).toList();
  List<product> get cart =>
      _item.where((p) => p.quantity > 0 && _cartIds.contains(p.id)).toList();

  final Set<String> _cartIds = {};

  void toggleFavorite(product product) {
    product.isFavorite = !product.isFavorite;
    notifyListeners(); // تحديث تلقائي للواجهة
  }

  void addToCart(product product) {
    _cartIds.add(product.id);
    notifyListeners();
  }

  double get totalPrice =>
      cart.fold(0, (sum, item) => sum + (item.price * item.quantity));

  void updateQuantity(product product, bool increase) {
    if (increase)
      product.quantity++;
    else if (product.quantity > 1) product.quantity--;
    notifyListeners();
  }
}
