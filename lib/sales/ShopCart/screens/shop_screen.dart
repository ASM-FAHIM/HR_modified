import 'package:flutter/material.dart';

import '../widgets/catalog_shops.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8CA6DB),
        title: Text('Shops'),
      ),
      body: SafeArea(
          child: Column(
            children: [
              CatalogShops(),
              // ElevatedButton(
              //   child: Text('Goto Cart'),
              //   onPressed: () =>
              //       Get.to(() => CartScreen()),
              // ),
            ],
          )
      ),
    );
  }
}
