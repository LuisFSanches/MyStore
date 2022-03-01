import 'package:flutter/material.dart';
import 'package:my_store/components/app_drawer.dart';
import 'package:my_store/components/product_item.dart';
import 'package:my_store/models/product_list.dart';
import 'package:my_store/utils/app_routes.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductList products = Provider.of(context);


    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciar Produtos'),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.of(context).pushNamed(AppRoutes.PRODUCT_FORM);
            }, 
            icon: Icon(Icons.add)
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: products.itemsCount,
          itemBuilder: (ctx, i) => Column(
            children: [
              ProductItem(product: products.items[i],),
              Divider()
            ],
          )
        ),
      ),
    );
  }
}