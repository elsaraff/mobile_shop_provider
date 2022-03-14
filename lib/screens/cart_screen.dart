import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_provider/providers/cart.dart' show Cart;
import 'package:shop_app_provider/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          if (cart.totalAmount > 0)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    const Text(
                      'Total: ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'EGP ${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: MaterialButton(
                        child: const Text(
                          'Confirm',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          cart.clear();
                        },
                        textColor: Theme.of(context).primaryColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cart.itemCount,
                  itemBuilder: (context, int i) => CartItem(
                        id: cart.item.values.toList()[i].id,
                        productId: cart.item.keys.toList()[i],
                        price: cart.item.values.toList()[i].price,
                        quantity: cart.item.values.toList()[i].quantity,
                        title: cart.item.values.toList()[i].title,
                        imageUrl: cart.item.values.toList()[i].imageUrl,
                      )),
            ),
          )
        ],
      ),
    );
  }
}
