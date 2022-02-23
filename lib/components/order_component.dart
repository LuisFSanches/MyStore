import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_store/models/order.dart';

class OrderComponent extends StatefulWidget {
  final Order order;
  const OrderComponent(this.order,{ Key? key }) : super(key: key);

  @override
  State<OrderComponent> createState() => _OrderComponentState();
}

class _OrderComponentState extends State<OrderComponent> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('R\$ ${widget.order.total.toStringAsFixed(2)}'),
          subtitle: Text(
            DateFormat('dd/MM/yyyy hh:mm').format(widget.order.date)
          ),
          trailing: IconButton(
            icon:Icon(Icons.expand_more),
            onPressed: (){
              setState(() {
                _expanded = !_expanded;
              });
            },
            ),
        ),
        if(_expanded)
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 4
          ),
          height: (widget.order.products.length * 25) + 10,
          child: ListView(
            children: 
             widget.order.products.map(
                (product) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      Text(
                        '${product.quantity}x R\$ ${product.price}',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey
                        ),
                      )
                  ],
                );
              }
            ).toList(),
          ),
        )
      ],
    );
  }
}