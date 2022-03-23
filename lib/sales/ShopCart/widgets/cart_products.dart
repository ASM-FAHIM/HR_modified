// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hrandsells/sales/ShopCart/controller/cart_controller.dart';
// import 'package:hrandsells/sales/ShopCart/models/product_model.dart';
//
// class CartProducts extends StatelessWidget {
//   final CartController controller = Get.find();
//   CartProducts({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() =>
//        SizedBox(
//         height: 550,
//         child: ListView.builder(
//           itemCount: controller.products.length,
//             itemBuilder: (BuildContext context, int index){
//             return CartProductsCard(
//               controller: controller,
//               products: controller.products.keys.toList()[index],
//               quantity: controller.products.values.toList()[index],
//               index: index,
//             );
//             }),
//       ),
//     );
//   }
// }
//
//
// class CartProductsCard extends StatelessWidget {
//   final CartController controller;
//   final Products products;
//   final int quantity;
//   final int index ;
//   const CartProductsCard({
//     Key? key,
//     required this.controller,
//     required this.products,
//     required this.quantity,
//     required this.index
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: EdgeInsets.symmetric(
//             horizontal: 10,vertical: 10
//         ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           InkWell(
//             child: CircleAvatar(
//               radius: 30,
//               child: Text('Image will be added soon'),
//             ),
//             onTap: () =>
//                 controller.addProduct(products),
//           ),
//           SizedBox(
//             width: 20,
//           ),
//           Expanded(
//             child: Text(
//               products.productName,
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,fontSize: 20
//               ),
//             ),
//           ),
//           IconButton(
//               onPressed: (){
//                 controller.removeProduct(products);
//               },
//               icon: Icon(Icons.remove,size: 25,)),
//           Text(
//             '${quantity}',
//             style: TextStyle(
//                 fontSize: 15
//             ),
//           ),
//           IconButton(
//               onPressed: () =>
//                 controller.addProduct(products),
//
//               icon: Icon(Icons.add,size: 25,)),
//         ],
//       ),
//     );
//   }
// }

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrandsells/sales/ShopCart/controller/cart_controller.dart';
import 'package:hrandsells/sales/ShopCart/models/product_model.dart';

class CartProducts extends StatelessWidget {
  final CartController controller = Get.find();
  CartProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 600,
        child: ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (BuildContext context, int index) {
              return CartProductsCard(
                controller: controller,
                products: controller.products.keys.toList()[index],
                quantity: controller.products.values.toList()[index],
                index: index,
              );
            }),
      ),
    );
  }
}

class CartProductsCard extends StatelessWidget {
  final CartController controller;
  final Products products;
  final int quantity;
  final int index;
  const CartProductsCard(
      {Key? key,
      required this.controller,
      required this.products,
      required this.quantity,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child:
                  //Text('Image will be added soon'),
                  Image(
                image: AssetImage('images/forklit.png'),
              ),
            ),
            onTap: () => controller.addProduct(products),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  products.productName,
                  style: TextStyle(
                      fontFamily: GoogleFonts.arvo().fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Text(
                  products.productDexcription,
                  style: TextStyle(
                      fontFamily: GoogleFonts.prata().fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                Text(
                  "BDT : " + products.price.toStringAsFixed(1),
                  style: TextStyle(
                      fontFamily: GoogleFonts.arvo().fontFamily,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                controller.removeProduct(products);
              },
              icon: Icon(
                Icons.remove,
                size: 20,
              )),
          Text(
            '${quantity}',
            style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily, fontSize: 20),
          ),
          IconButton(
              onPressed: () => controller.addProduct(products),
              icon: Icon(
                Icons.add,
                size: 20,
              )),
        ],
      ),
    );
  }
}
