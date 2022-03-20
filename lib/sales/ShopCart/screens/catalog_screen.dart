import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrandsells/sales/ShopCart/controller/cart_controller.dart';
import 'package:hrandsells/sales/ShopCart/widgets/catalog_products.dart';



import 'cart_screen.dart';


class CatalogScreen extends StatelessWidget {
  CartController cartController = Get.put(CartController());
   CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8CA6DB),
        title: Text('Products'),
        actions: [
          // IconButton(
          //     onPressed: () => Get.to(() => CartScreen()),
          //     icon: Icon(Icons.shopping_cart_outlined, size: 30,)),
          FloatingActionButton.extended(
              backgroundColor: Color(0xFF8CA6DB),
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 30,
              ),
              onPressed: () => Get.to(() => CartScreen()),
              label: Obx(() => Text(cartController.count.toString())))

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
