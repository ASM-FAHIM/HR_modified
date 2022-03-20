import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrandsells/sales/cart.dart';

class NewOrder_page extends StatefulWidget {
  const NewOrder_page({Key? key}) : super(key: key);

  @override
  _NewOrder_pageState createState() => _NewOrder_pageState();
}

class _NewOrder_pageState extends State<NewOrder_page> {

  String dropdownValue = 'Pick';

  int item = 0;

  bool _progressBarActive = true;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF8CA6DB),
            title: Center(
                child: Text("New Order",
                  style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ),
            actions: [

              IconButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart_Page()));
                  },
                  icon: Icon(Icons.shopping_cart,
                    size: 30,
                    color: Colors.white,
                  ),
              ),

              SizedBox(width: 20,),
            ],
          ),

          body: SingleChildScrollView(
            child: Column(
                  children: [

                    Container(
                      //color: Colors.blue,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 2,
                          itemBuilder: (BuildContext context,int index){
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FlatButton(
                                color: Colors.grey,
                                onPressed: (){
                                  setState(() {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text("Added to Cart",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ));

                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      child: Image(
                                        image: AssetImage("images/forklit.png"),
                                      ),
                                    ),

                                    Text("Fork Lift "),

                                    // SizedBox(width: 100,),



                                    // IconButton(
                                    //     onPressed: (){
                                    //       setState(() {
                                    //         if(item == 0){
                                    //           item=0;
                                    //         }
                                    //         else{
                                    //           item--;
                                    //         }
                                    //       });
                                    //     },
                                    //     icon: Icon(Icons.remove)
                                    // ),
                                    // Text("$item"),
                                    //
                                    // IconButton(
                                    //     onPressed: (){
                                    //       setState(() {
                                    //           item++;
                                    //       });
                                    //     },
                                    //     icon: Icon(Icons.add)
                                    // ),

                                  ],
                                ),
                              ),
                            );
                          }
                      ),
                    ),



                  ],
                ),
          ),
        ),
      ),
    );
  }
}
