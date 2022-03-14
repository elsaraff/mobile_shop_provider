import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_provider/providers/products.dart';
import 'package:shop_app_provider/screens/product_detail_screen.dart';
import 'package:shop_app_provider/widgets/functions.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        children: [
          ClipRRect(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: InkWell(
              onTap: () {
                navigateTo(context,
                    ProductDetailScreen(productID: product.id.toString()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Image.network(
                  product.imageUrl,
                  width: double.infinity,
                  height: 150.0,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(children: [
                Text(product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                    ))
              ]),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    'EGP ${product.price}',
                    style: TextStyle(
                        color: Colors.grey[20],
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: const Icon(Icons.add_shopping_cart),
                    padding: EdgeInsets.zero,
                    color: Colors.deepPurple,
                    tooltip: 'add to cart',
                    onPressed: () {
                      HapticFeedback.vibrate();
                      cart.addItem(
                        product.id,
                        product.price,
                        product.title,
                        product.imageUrl,
                      );
                    },
                  ),
                  Consumer<Product>(
                    builder: (context, product, child) {
                      return IconButton(
                        icon: Icon(_favoriteIcon(product)),
                        padding: EdgeInsets.zero,
                        color: Colors.deepPurple,
                        tooltip: 'add to favorites',
                        onPressed: () {
                          product.toggleFavoriteStatus();
                        },
                      );
                    },
                  )
                ]),
              )
            ],
          ),
        ],
      ),
    );
  }

  IconData _favoriteIcon(Product product) {
    if (product.isFavorite) {
      return Icons.favorite;
    } else {
      return Icons.favorite_border;
    }
  }
}
