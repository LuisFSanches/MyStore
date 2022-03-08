
import 'package:flutter/material.dart';
import 'package:my_store/components/app_drawer.dart';
import 'package:my_store/components/order_component.dart';
import 'package:my_store/models/order_list.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Pedidos'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future:Provider.of<OrderList>(context, listen: false).loadOrders(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          } else if(snapshot.error != null){
            return Center(child: Text('Ocorreu um erro!'),);
          }
          else{
            return Consumer<OrderList>(
              builder:(context,orders, child) => ListView.builder(
                  itemCount: orders.items.length,
                  itemBuilder: (ctx,i)=>OrderComponent(orders.items[i])
              ),
            );
          }
        }
        ),
     //body:_isLoading 
       // ? Center(child: CircularProgressIndicator(),)  
       // : ListView.builder(
        //  itemCount: orders.items.length,
        //  itemBuilder: (ctx,i)=>OrderComponent(orders.items[i])
      // )
    );
  }
}