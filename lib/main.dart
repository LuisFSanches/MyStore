import 'package:flutter/material.dart';
import 'package:my_store/models/product_list.dart';
import 'package:my_store/pages/product_detail_page.dart';
import 'package:my_store/pages/products_overview_page.dart';
import 'package:my_store/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();
    return ChangeNotifierProvider(
      create: (_)=>ProductList(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: tema.copyWith(
          colorScheme: tema.colorScheme.copyWith(
            primary: Colors.purple,
            secondary: Colors.deepOrange,
          ),
          textTheme: tema.textTheme.apply(fontFamily:'Lato' )
        ),
        
        home:  ProductsOverviewPage(),
        routes: {
          AppRoutes.PRODUCT_DETAIL: (ctx)=>const ProductDetailPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

