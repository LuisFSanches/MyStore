import 'package:flutter/material.dart';
import 'package:my_store/components/cart_item_component.dart';
import 'package:my_store/models/cart.dart';
import 'package:my_store/models/order_list.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of(context);
    final items = cart.items.values.toList();
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(25),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                  SizedBox(width: 10,),
                 Chip(
                   backgroundColor: Theme.of(context).colorScheme.primary,
                   label: Text(
                     'R\$ ${cart.totalAmount.toStringAsFixed(2)}',
                     style: TextStyle(
                       color: Colors.white
                       ),
                    )
                 ),
                  Spacer(),
                  CartButton(cart: cart)
                ]
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx,i)=> CartItemComponent(items[i])
              )
            )
        ],
      ),
    );
  }
}

class CartButton extends StatefulWidget {
  const CartButton({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return _isLoading ? CircularProgressIndicator() : TextButton(
      onPressed: widget.cart.itemsCount == 0 
      ? null 
      :() async{
        setState(() => _isLoading = true);
        await Provider.of<OrderList>(context, listen: false).addOrder(widget.cart);
        widget.cart.clear();
        setState(() => _isLoading = false);
      }, 
      child:Text('COMPRAR'),
      style: TextButton.styleFrom(
        textStyle: TextStyle(color: Theme.of(context).colorScheme.primary)
      ),
    );
  }
}