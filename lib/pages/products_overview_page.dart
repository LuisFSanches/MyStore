import 'package:flutter/material.dart';
import 'package:my_store/components/app_drawer.dart';
import 'package:my_store/components/badge.dart';
import 'package:my_store/components/product_grid.dart';
import 'package:my_store/models/cart.dart';
import 'package:my_store/models/product_list.dart';
import 'package:my_store/utils/app_routes.dart';
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
              ),
            ],
            onSelected: (FilterOptions selectedValue){
             setState(() {
                if(selectedValue == FilterOptions.Favorite){
                    _showFavoriteOnly = true;
              } else{
                    _showFavoriteOnly = false;
              }
             });
            }
          ),
          Consumer<Cart>(
            builder:(ctx, cart, child) =>Badge(
              value: cart.itemsCount.toString(),
              child: IconButton(
                onPressed: (){
                  Navigator.of(context).pushNamed(AppRoutes.CART);
                }, 
                icon: Icon(Icons.shopping_cart)
              ),
            ),
          )
        ],
      ),
      body:  ProductGrid(_showFavoriteOnly),
      drawer: AppDrawer(),
    );
  }
}