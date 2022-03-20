import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrandsells/sales/ShopCart/controller/shop_controller.dart';
import 'package:hrandsells/sales/ShopCart/models/shop_model.dart';

import '../screens/catalog_screen.dart';


class CatalogShops extends StatelessWidget {
  const CatalogShops({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: ListView.builder(
            itemCount: ShopList.shops.length,
            itemBuilder: (BuildContext context, int index){
              return CatalogShopCard(index: index,);
            }));
  }
}


class CatalogShopCard extends StatelessWidget {
  final ShopController controller = Get.put(ShopController());
  int index;
  CatalogShopCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10
        ),
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              child: Text('Image will added soon'),
            ),
            SizedBox(width: 30,),
            Expanded(child: Text(ShopList.shops[index].shop_name, style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),))
          ],
        ),
        onTap: () =>
            Get.to(() => CatalogScreen()),
      ),
    );
  }
}

