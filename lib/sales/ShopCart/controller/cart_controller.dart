// import 'package:get/get.dart';
// import 'package:hrandsells/sales/ShopCart/models/product_model.dart';
//
// class CartController extends GetxController{
//   var _products = {}.obs;
//
//   void addProduct(Products products){
//     if(_products.containsKey(products)){
//       _products[products] += 1;
//     }else{
//       _products[products] = 1;
//     }
//
//     // Get.snackbar(
//     //     "Product Added",
//     //     "you have added ${products.productName}",
//     //   snackPosition: SnackPosition.BOTTOM,
//     //   duration: Duration(seconds: 1),
//     // );
//   }
//
//   get products => _products;
//
//   void removeProduct(Products products){
//     if(_products.containsKey(products) && _products[products] ==1){
//       _products.removeWhere((key, value) => key == products);
//     }else{
//       _products[products] -= 1;
//     }
//   }
//
//   //subTotal of products
//   get productSubTotal =>
//       _products.entries.map((products) =>
//       products.key.price *  products.value
//       ).toList();
//
//   //get totalprice
//   get total =>
//       _products.entries.map((products) =>
//       products.key.price *  products.value
//       ).toList()
//       .reduce((value, element) => value + element)
//       .toString();
//
//
// }


import 'package:get/get.dart';
import 'package:hrandsells/sales/ShopCart/models/product_model.dart';

class CartController extends GetxController{
  var _products = {}.obs;

  void addProduct(Products products){
    if(_products.containsKey(products)){
      _products[products] += 1;
    }else{
      _products[products] = 1;
    }

    // Get.snackbar(
    //     "Product Added",
    //     "you have added ${products.productName}",
    //   snackPosition: SnackPosition.BOTTOM,
    //   duration: Duration(seconds: 1),
    // );
  }

  get products => _products;

  void removeProduct(Products products){
    if(_products.containsKey(products) && _products[products] ==1){
      _products.removeWhere((key, value) => key == products);
    }else{
      _products[products] -= 1;
    }
  }

  //subTotal of products
  get productSubTotal =>
      _products.entries.map((products) =>
      products.key.price *  products.value
      ).toList();

  //get totalprice
  get total =>
      _products.entries.map((products) =>
      products.key.price *  products.value
      ).toList()
          .reduce((value, element) => value + element)
          .toString();

  String getTotal() {
    try {
      return _products.entries
          .map((products) => products.key.price * products.value)
          .toList()
          .reduce((value, element) => value + element)
          .toString();
    } catch (e) {
      return '0.0';
    }
  }
}