import 'package:e_commerce/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var favorites = Provider.of<cartProvide>(context).favorits;
    return Scaffold(
      appBar: AppBar(
        title: Text("My_Favorite"),
      ),
      body: ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (c, i) => ListTile(
                title: Text(favorites[i].name),
                trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () =>
                        Provider.of<cartProvide>(context, listen: false)
                            .toggleFavorite(favorites[i])),
              )),
    );
  }
}
