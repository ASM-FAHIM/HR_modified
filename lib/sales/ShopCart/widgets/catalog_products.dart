import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrandsells/sales/ShopCart/controller/cart_controller.dart';
import 'package:hrandsells/sales/ShopCart/models/product_model.dart';


class CatalogProduct extends StatelessWidget {
  const CatalogProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: ListView.builder(
            itemCount: Products.products.length,
            itemBuilder: (BuildContext context, int index){
              return CatalogProductCard(index: index);
            }));
  }
}


class CatalogProductCard extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  final int index;
  CatalogProductCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10
        ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 30,
            child: Text(Products.products[index].productImage),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Text(Products.products[index].productName,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              Text(Products.products[index].productDexcription),
            ],
          ),

          Text(Products.products[index].price.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          IconButton(
              onPressed: () =>
                cartController.addProduct(Products.products[index]),

              icon: Icon(Icons.add,size: 20,)
          )
        ],
      ),
    );
  }
}

