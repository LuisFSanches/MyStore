import 'package:flutter/material.dart';
import 'package:my_store/models/cart.dart';
import 'package:my_store/models/cart_item.dart';
import 'package:provider/provider.dart';

class CartItemComponent extends StatelessWidget {
  final CartItem cartItem;

  const CartItemComponent(this.cartItem,{ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartItem.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        child: const Icon(Icons.delete, color: Colors.white,size:40),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4
        ),
      ),
      onDismissed: (_){
        Provider.of<Cart>(
          context, 
          listen: false
          ).removeItem(cartItem.productId);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
              leading: CircleAvatar(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: FittedBox(
                    child: Text('${cartItem.price}'),
                  ),
                )
                ),
              title: Text(cartItem.name),
              subtitle: Text('Total: R\$ ${cartItem.price * cartItem.quantity}'),
              trailing: Text('${cartItem.quantity}x'),
          ),
        ),
      ),
    );
  }
}