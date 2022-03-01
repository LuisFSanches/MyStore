import 'package:flutter/material.dart';
import 'package:my_store/components/product_grid_item.dart';
import 'package:my_store/models/product.dart';
import 'package:my_store/models/product_list.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {

  final bool showFavoriteOnly;
  
  ProductGrid(this.showFavoriteOnly);
  
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final List<Product> loadedProducts = showFavoriteOnly ? provider.favoriteItems : provider.items;

    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: loadedProducts.length,
        itemBuilder: (ctx,i)=> ChangeNotifierProvider.value(
          value: loadedProducts[i],
          child: ProductGridItem()
          ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
        ),
    );
  }
}