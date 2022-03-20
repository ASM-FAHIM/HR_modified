import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrandsells/sales/ShopCart/widgets/catalog_products.dart';


import 'cart_screen.dart';


class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8CA6DB),
        title: Text('Products'),
        actions: [
          IconButton(
              onPressed: () => Get.to(() => CartScreen()),
              icon: Icon(Icons.shopping_cart_outlined, size: 30,)),
        ],
      ),
      body: SafeArea(
          child: Column(
            children: [
              CatalogProduct(),
              // ElevatedButton(
              //   child: Text('Goto Cart'),
              //   onPressed: () =>
              //     Get.to(() => CartScreen()),
              // ),
            ],
          )
      ),
    );
  }
}
