import 'package:e_commerce/Favorite_Screen.dart';
import 'package:e_commerce/main.dart';
import 'package:e_commerce/shopping_cart.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Prodect extends StatelessWidget {
  const Prodect({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<cartProvide>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "prodected",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 95, 51, 4),
        actions: [
          IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (c) => FavoriteScreen()))),
          IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (c) => CartScreen()))),
        ],
      ),
      
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.75),
        itemCount: provider.item.length,
        itemBuilder: (context, i) {
          final products = provider.item[i];
          return Card(
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  color: Colors.grey[200],
                  child:
                  (products.imag),
                  
                )),
                Text(
                  products.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("\$${products.price}"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: Icon(
                          products.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                        ),
                        onPressed: () =>
                          provider.toggleFavorite(products)
                        ),
                    IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("add to shopping_cart"),
                          ));
                          provider.addToCart(products);
                        })
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
