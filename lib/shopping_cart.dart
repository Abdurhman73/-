import 'package:e_commerce/main.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<cartProvide>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping_cart"),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: provider.cart.length,
            itemBuilder: (c, i) {
              final items = provider.cart[i];
              return ListTile(
                title: Text(items.name),
                subtitle: Text("\$${items.price}"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () => provider.updateQuantity(items, false)),
                    Text("${items.quantity}"),
                    IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => provider.updateQuantity(items, true)),
                  ],
                ),
              );
            },
          )),
          Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text("\$${provider.totalPrice.toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 20, color: Colors.blue)),
                ],
              )),
        ],
      ),
    );
  }
}
