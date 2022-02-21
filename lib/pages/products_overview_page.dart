import 'package:flutter/material.dart';
import 'package:my_store/components/product_grid.dart';
import 'package:my_store/models/product_list.dart';
import 'package:provider/provider.dart';

enum FilterOptions{
  Favorite,
  All
}

class ProductsOverviewPage extends StatefulWidget {

  @override
  State<ProductsOverviewPage> createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {

  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Loja'),
        actions: [
          PopupMenuButton(
            itemBuilder: (_)=>[
              PopupMenuItem(
                child: Text('Somente Favoritos'),
                value: FilterOptions.Favorite,
              ),
              PopupMenuItem(
                child: Text('Todos'),
                value: FilterOptions.All,
              )
            ],
            onSelected: (FilterOptions selectedValue){
             setState(() {
                if(selectedValue == FilterOptions.Favorite){
                    _showFavoriteOnly = true;
              } else{
                    _showFavoriteOnly = false;
              }
              print(_showFavoriteOnly);
             });
            }
          )
        ],
      ),
      body:  ProductGrid(_showFavoriteOnly)
    );
  }
}