// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hrandsells/sales/ShopCart/controller/cart_controller.dart';
//
// class CartTotal extends StatelessWidget {
//   final CartController cartController = Get.find();
//   CartTotal({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() =>
//       Container(
//         padding: EdgeInsets.symmetric(horizontal: 90),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//                 'Total :',
//               style: TextStyle(
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold
//               ),
//             ),
//             Text(
//               '${cartController.total}',
//               style: TextStyle(
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrandsells/sales/ShopCart/controller/cart_controller.dart';

class CartTotal extends StatelessWidget {
  final CartController cartController = Get.find();
  CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Container(
                  //padding: EdgeInsets.symmetric(horizontal: 90),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sub Total: ',
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 18,
                                // fontFamily:
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            '${cartController.getTotal()}'+' Taka',
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                color: Colors.teal,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Discount: ',
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 18,
                                // fontFamily:
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            '0.0 Taka',
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                color: Colors.teal,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),

                        ],
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total :',
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(' '+
                              '${cartController.getTotal()}'+' Taka',
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                color: Colors.teal,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                InkWell(
                  child: Container(
                    height: 55,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.green,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart,color: Colors.black,),
                        Text('Checkout',
                          style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: (){
                    Get.snackbar('Confirmed', 'Successfully added',
                        snackPosition: SnackPosition.BOTTOM
                    );
                  },
                ),
              ],
            ),
          ],
        ),
    );
  }
}