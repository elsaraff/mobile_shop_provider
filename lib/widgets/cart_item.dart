import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final double price;
  final int quantity;
  final String imageUrl;

  const CartItem({
    Key? key,
    required this.id,
    required this.productId,
    required this.title,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Dismissible build(BuildContext context) => Dismissible(
        direction: DismissDirection.horizontal,
        key: ValueKey(id),
        onDismissed: (_) {
          Provider.of<Cart>(context, listen: false).removeItem(productId);
          HapticFeedback.vibrate();
        },
        background: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: Theme.of(context).errorColor,
          child: Row(
            children: const [
              Icon(
                Icons.delete,
                color: Colors.white,
                size: 40,
              ),
              Spacer(),
              Icon(
                Icons.delete,
                color: Colors.white,
                size: 40,
              ),
            ],
          ),
        ),
        child: Card(
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 4,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ListTile(
              leading: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
              title: Text(title),
              subtitle: Text('Total: EGP ${(price * quantity)}'),
              trailing: Text('$quantity x'),
            ),
          ),
        ),
      );
}
