import 'package:flutter/material.dart';
import 'package:my_store/models/cart.dart';
import 'package:my_store/models/product.dart';
import 'package:my_store/utils/app_routes.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
            ),
          onTap: (){
            Navigator.of(context).pushNamed(
              AppRoutes.PRODUCT_DETAIL,
              arguments: product
            );
          },
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: IconButton(
            onPressed:(){
              product.toggleFavorite();
            } ,
            icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_outline),
            color: Theme.of(context).colorScheme.secondary,
          ),
          title: Text(
            product.name,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            onPressed: (){
              cart.addItem(product);
              print(cart.itemsCount);
            }, 
            icon: const Icon(Icons.shopping_cart),
            color: Theme.of(context).colorScheme.secondary,
            ),
        ),
      ),
    );
  }
}