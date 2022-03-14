import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_provider/screens/cart_screen.dart';
import 'package:shop_app_provider/widgets/functions.dart';

import '../widgets/products_grid.dart';
import '../widgets/badge.dart';

import '../providers/cart.dart';

enum FilterOptions {
  favorites,
  all,
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        titleSpacing: 0,
        title: const Text('Home Page'),
        actions: [
          Consumer<Cart>(
            builder: (context, cart, child) => Badge(
              child: IconButton(
                onPressed: () {
                  navigateTo(context, const CartScreen());
                  cart.clearThings();
                  debugPrint(cart.thingsCount.toString());
                },
                icon: const Icon(
                  Icons.shopping_cart,
                ),
              ),
              value: cart.thingsCount.toString(),
            ),
          ),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            onSelected: (FilterOptions selectValue) {
              setState(() {
                if (selectValue == FilterOptions.favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.favorites,
              ),
              const PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.all,
              )
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ProductsGrid(_showOnlyFavorites)),
    );
  }
}
