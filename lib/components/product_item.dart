// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_store/models/product.dart';
import 'package:my_store/models/product_list.dart';
import 'package:my_store/utils/app_routes.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({ Key? key, required this.product }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final msg = ScaffoldMessenger.of(context);

    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.name),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: (){
                Navigator.of(context).pushNamed(
                  AppRoutes.PRODUCT_FORM,
                  arguments: product
                  );
              }, 
              icon: Icon(Icons.edit, color: Colors.purple,)
            ),
            IconButton(
              onPressed: (){
                // ignore: avoid_single_cascade_in_expression_statements
                showDialog<bool>(
                  context: context, 
                  builder: (ctx)=>AlertDialog(
                    title: Text('Excluir Produto'),
                    content: Text('Tem certeza?'),
                    actions: [
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).pop(false);
                        }, 
                        child: Text('Não')
                        ),
                        TextButton(
                        onPressed: (){
                           Navigator.of(context).pop(true);
                        }, 
                        child: Text('Sim')
                        ),
                    ],
                  )
                  )..then((value) async{
                    if(value ?? false){
                      try{
                        await Provider.of<ProductList>(
                          context,
                          listen: false
                        ).removeProduct(product);
                      }catch(error){
                       msg.showSnackBar(
                         SnackBar(
                           content: Text(error.toString())
                           )
                         );
                      } 
                    }
                  });
              }, 
              icon: Icon(Icons.delete, color:Colors.red)
            )
          ],
        ),
      ),
    );
  }
}