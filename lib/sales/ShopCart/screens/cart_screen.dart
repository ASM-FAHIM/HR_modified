import 'package:flutter/material.dart';

import '../widgets/cart_products.dart';
import '../widgets/cart_total.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8CA6DB),
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          CartProducts(),
          CartTotal()
        ],
      )
    );
  }
}

