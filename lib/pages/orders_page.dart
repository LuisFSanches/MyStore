
import 'package:flutter/material.dart';
import 'package:my_store/components/app_drawer.dart';
import 'package:my_store/components/order_component.dart';
import 'package:my_store/models/order_list.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderList orders = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Pedidos'),
      ),
      drawer: AppDrawer(),
     body:ListView.builder(
       itemCount: orders.items.length,
       itemBuilder: (ctx,i)=>OrderComponent(orders.items[i])
       )
    );
  }
}