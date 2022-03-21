import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrandsells/data_model/loginModel.dart';
import 'package:hrandsells/data_model/promotion.dart';
import 'package:hrandsells/hr/absent_approval.dart';
import 'package:hrandsells/hr/attendance_page.dart';
import 'package:hrandsells/hr/leave_tour.dart';
import 'package:hrandsells/hr/payslip_page.dart';
import 'package:hrandsells/packages/test.api.dart';
import 'package:hrandsells/sales/sales_homepage.dart';
import 'package:hrandsells/test/loop.dart';
import 'package:slide_drawer/slide_drawer.dart';
import 'package:intl/intl.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;

import 'data_model/xyearperdate.dart';
import 'hr/notification.dart';

class Homepage extends StatefulWidget {
  // const Homepage({Key? key}) : super(key: key);

  LoginModel loginModel;

  Homepage({required this.loginModel});

  @override
  _HomepageState createState() => _HomepageState();
}


// Future<List<PromotionModel>> fetchPost() async {
//   final response =
//   await http.get(Uri.parse('http://flutterapi.brotherdev.com/api.php'));
//
//
//
//   if (response.statusCode == 200) {
//     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
//
//     return parsed.map<PromotionModel>((json) => PromotionModel.fromJson(json)).toList();
//   } else {
//     throw Exception('Failed to load album');
//   }
// }


class _HomepageState extends State<Homepage> {

  String date = DateFormat("yyyy-MM-dd").format(DateTime.now());
  DateTime now = DateTime.now();
  String intime = '';
  String outtime = '';
  bool pressAttention = false;
  bool pressAttention1 = false;
  late String _currentAddress =" ";
  late String _currentAddressout =" ";

  Future<List<PromotionModel>>? futurePost;

  Future<void> getLocationin() async {
    Position position = await Geolocator.getCurrentPosition();
    print(position.latitude);
    print(position.longitude);

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress = "${place.locality}, ${place.postalCode}, ${place.country}";
        //_currentAddressout = "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
    //print(_currentAddress);

  }


  late XbalanceModel leave_remain1;
  String xbalance = " ";

  Future<String>  getAPIDATA() async {

    http.Response response = await http.post(Uri.parse('http://172.20.20.69/api/availableleave.php'),
        body:jsonEncode(<String, String>{
          "xstaff": widget.loginModel.xstaff,
          "xtypeleave": "Annual Leave"
        })
    );

    print("Body:"+response.body);
    print(response.statusCode);

    leave_remain1 = xbalanceModelFromJson(response.body);
    print("Test:"+leave_remain1.xbalance);

    xbalance = leave_remain1.xbalance;

    return '';
  }


  Future<void> getLocationout() async {
    Position position = await Geolocator.getCurrentPosition();
    print(position.latitude);
    print(position.longitude);

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      Placemark place = placemarks[0];

      setState(() {
        //_currentAddress = "${place.locality}, ${place.postalCode}, ${place.country}";
        _currentAddressout = "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
    //print(_currentAddress);

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAPIDATA();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,

            title: Center(child:
            // Image(
            //   image: AssetImage(
            //       'images/orange.png'),
            //   height: 150,
            //   width: 140,
            // ),
              Text(widget.loginModel.xstaff,
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            // leading: IconButton(
            //   icon: Icon(Icons.menu,
            //     color: Colors.blue,),
            //   // call toggle from SlideDrawer to alternate between open and close
            //   // when pressed menu button
            //   //onPressed: () => SlideDrawer.of(context)!.toggle(),
            //   onPressed: () => SlideDrawer.of(context)!.toggle(),
            // ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.logout,
                        color: Colors.blue)
                ),
              ),
            ],
          ),
          
          body: SingleChildScrollView(
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.only(top: 20.0,right: 20,left: 20),
                  child: Container(
                    //height: MediaQuery.of(context).size.width/2,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // color: ispressed ? Colors.white : Colors.grey,
                      //border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    // child: Column(
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     // Padding(
                    //     //   padding: const EdgeInsets.all(10.0),
                    //     //   child: Container(
                    //     //     height: 150,
                    //     //     width: MediaQuery.of(context).size.width,
                    //     //     // decoration: BoxDecoration(
                    //     //     //   borderRadius: BorderRadius.circular(10),
                    //     //     //   color: Colors.white,
                    //     //     //   border: Border.all(color: const Color(0xFFf4ad5e)),
                    //     //     //
                    //     //     // ),
                    //     //     child: Column(
                    //     //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     //       children: [
                    //     //         FlatButton(
                    //     //           minWidth: MediaQuery.of(context).size.width/3,
                    //     //           color: pressAttention ? Colors.green : Colors.white10,
                    //     //           onPressed: () {
                    //     //             //something will change
                    //     //             getLocationin();
                    //     //             setState(() {
                    //     //               DateTime now = DateTime.now();
                    //     //               date = now.toString();
                    //     //               String Onlydate = new DateFormat("h:mm:ssa").format(now);
                    //     //               intime = '$Onlydate';
                    //     //               pressAttention = !pressAttention;
                    //     //             });
                    //     //             print(intime);
                    //     //           },
                    //     //           child: Column(
                    //     //             children: [
                    //     //               Text("IN",
                    //     //                 textAlign: TextAlign.center,
                    //     //                 style: GoogleFonts.openSans(
                    //     //                   fontSize: 15,
                    //     //                   fontWeight: FontWeight.bold,
                    //     //                   color: pressAttention ? Colors.black : Colors.black,
                    //     //                 ),
                    //     //               ),
                    //     //
                    //     //               SizedBox(width: 20,),
                    //     //
                    //     //               Text("$intime",
                    //     //                 textAlign: TextAlign.center,
                    //     //                 style: GoogleFonts.openSans(
                    //     //                   fontSize: 15,
                    //     //                   color: pressAttention ? Colors.black : Colors.white,
                    //     //                 ),
                    //     //               ),
                    //     //
                    //     //               Text(_currentAddress,
                    //     //                 textAlign: TextAlign.center,
                    //     //                 style: GoogleFonts.openSans(
                    //     //                   fontSize: 15,
                    //     //                   color: pressAttention ? Colors.black : Colors.white,
                    //     //                 ),
                    //     //               ),
                    //     //
                    //     //
                    //     //
                    //     //             ],
                    //     //           ),
                    //     //         ),
                    //     //
                    //     //         // SizedBox(width: 15,),
                    //     //         //
                    //     //         // Divider(thickness: 1,color: Colors.red,),
                    //     //
                    //     //         // SizedBox(width: 15,),
                    //     //
                    //     //         FlatButton(
                    //     //           minWidth: MediaQuery.of(context).size.width/3,
                    //     //           color: pressAttention1 ? Colors.red : Colors.white,
                    //     //           onPressed: ()async {
                    //     //             //something will change
                    //     //             getLocationout();
                    //     //             setState(() {
                    //     //               DateTime now = DateTime.now();
                    //     //               date = now.toString();
                    //     //               String Onlydate = new DateFormat("h:mm:ssa").format(now);
                    //     //               outtime = '$Onlydate';
                    //     //               pressAttention1 = !pressAttention1;
                    //     //               print(outtime);
                    //     //             });
                    //     //           },
                    //     //           child: Column(
                    //     //             children: [
                    //     //               Text("OUT",
                    //     //                 textAlign: TextAlign.center,
                    //     //                 style: GoogleFonts.openSans(
                    //     //                   fontSize: 15,
                    //     //                   fontWeight: FontWeight.bold,
                    //     //                   color: Colors.black,
                    //     //                 ),
                    //     //               ),
                    //     //
                    //     //               SizedBox(width: 20,),
                    //     //
                    //     //               Text("$outtime",
                    //     //                 textAlign: TextAlign.center,
                    //     //                 style: GoogleFonts.openSans(
                    //     //                   fontSize: 15,
                    //     //                   color: pressAttention1 ? Colors.black : Colors.white,
                    //     //                 ),
                    //     //               ),
                    //     //
                    //     //               Text(_currentAddressout,
                    //     //                 textAlign: TextAlign.center,
                    //     //                 style: GoogleFonts.openSans(
                    //     //                   fontSize: 15,
                    //     //                   color: pressAttention1 ? Colors.black : Colors.white,
                    //     //                 ),
                    //     //               ),
                    //     //             ],
                    //     //           ),
                    //     //         ),
                    //     //       ],
                    //     //     ),
                    //     //   ),
                    //     // )
                    //
                    //
                    //
                    //   ],
                    // ),

                    // child: CarouselSlider(
                    //   options: CarouselOptions(height: 150.0,
                    //     enlargeCenterPage: true,
                    //     enableInfiniteScroll: true,
                    //     autoPlayAnimationDuration: Duration(seconds: 1),
                    //     autoPlayCurve: Curves.linear,
                    //     //height: MediaQuery.of(context).size.height * 0.35,
                    //     autoPlay: true,
                    //     reverse: false,
                    //     autoPlayInterval: Duration(seconds: 2),
                    //     //pauseAutoPlayOnTouch: Duration(seconds: 10),
                    //   ),
                    //   items: [
                    //     ('http://172.20.20.69/monyeem/images/monyeem.png'),
                    //     ('http://172.20.20.69/monyeem/images/raad.png'),
                    //     ('http://172.20.20.69/monyeem/images/sina.png'),
                    //     ('http://172.20.20.69/monyeem/images/niloy.png'),
                    //     ('http://172.20.20.69/monyeem/images/fahim.png'),
                    //     // 'images/monyeem.png',
                    //     // 'images/sina.png',
                    //     // 'images/niloy.png',
                    //     // 'images/fahim.png',
                    //   ].map((i) {
                    //     return Builder(
                    //       builder: (BuildContext context) {
                    //         return Container(
                    //           width: MediaQuery.of(context).size.width,
                    //           margin: EdgeInsets.symmetric(horizontal: 5.0),
                    //           decoration: BoxDecoration(color: Colors.white),
                    //           child: GestureDetector(
                    //             child: Image.network(i, fit: BoxFit.fill),
                    //             onTap: () {
                    //               print("Tapped");
                    //             },
                    //           ),
                    //         );
                    //       },
                    //     );
                    //   }).toList(),
                    // ),

                    // child: FutureBuilder<List<PromotionModel>>(
                    //   future: futurePost,
                    //   builder: (context, snapshot) {
                    //     if (snapshot.hasData) {
                    //       return ListView.builder(
                    //         itemCount: snapshot.data!.length,
                    //         itemBuilder: (_, index) => Container(
                    //           child: CarouselSlider(
                    //               options: CarouselOptions(height: 150.0,
                    //                 enlargeCenterPage: true,
                    //                 enableInfiniteScroll: true,
                    //                 autoPlayAnimationDuration: Duration(seconds: 1),
                    //                 autoPlayCurve: Curves.linear,
                    //                 //height: MediaQuery.of(context).size.height * 0.35,
                    //                 autoPlay: true,
                    //                 reverse: false,
                    //                 autoPlayInterval: Duration(seconds: 2),
                    //                 //pauseAutoPlayOnTouch: Duration(seconds: 10),
                    //               ),
                    //               items: [
                    //                 //(snapshot.data![index].ximage).toString()
                    //                 ('http://172.20.20.69/monyeem/images/monyeem.png'),
                    //                 ('http://172.20.20.69/monyeem/images/raad.png'),
                    //                 ('http://172.20.20.69/monyeem/images/sina.png'),
                    //                 ('http://172.20.20.69/monyeem/images/niloy.png'),
                    //                 ('http://172.20.20.69/monyeem/images/fahim.png'),
                    //                 // 'images/monyeem.png',
                    //                 // 'images/sina.png',
                    //                 // 'images/niloy.png',
                    //                 // 'images/fahim.png',
                    //               ].map((i) {
                    //                 return Builder(
                    //                   builder: (BuildContext context) {
                    //                     return Container(
                    //                       width: MediaQuery.of(context).size.width,
                    //                       margin: EdgeInsets.symmetric(horizontal: 5.0),
                    //                       decoration: BoxDecoration(color: Colors.white),
                    //                       child: GestureDetector(
                    //                         child: Image.network(i, fit: BoxFit.fill),
                    //                         onTap: () {
                    //                           print("Tapped");
                    //                         },
                    //                       ),
                    //                     );
                    //                   },
                    //                 );
                    //               }).toList(),
                    //             ),
                    //
                    //           ),
                    //       );
                    //     } else {
                    //       return Center(
                    //         child: Image(image: AssetImage("images/loading.gif")),
                    //       );
                    //     }
                    //   },
                    // ),

                  ),
                ),

                SizedBox(height: 10,),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     Center(
                //       child: Container(
                //         height: 40,
                //         width: 100,
                //         decoration: BoxDecoration(
                //           color: Colors.green,
                //           //border: Border.all(color: Colors.grey),
                //           borderRadius: BorderRadius.circular(10),
                //           boxShadow: [
                //             BoxShadow(
                //               color: Colors.grey.withOpacity(0.5),
                //               spreadRadius: 1,
                //               blurRadius: 5,
                //               offset: Offset(0, 3), // changes position of shadow
                //             ),
                //           ],
                //         ),
                //         child: FlatButton(
                //           shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(20.0)),
                //
                //           onPressed: () {
                //             //something will change
                //             setState(() {
                //               DateTime now = DateTime.now();
                //               date = now.toString();
                //               String Onlydate = new DateFormat("h:mm:ssa").format(now);
                //               intime = '$Onlydate';
                //             });
                //             print(intime);
                //           },
                //           child: Text("IN",
                //             textAlign: TextAlign.center,
                //             style: GoogleFonts.openSans(
                //               fontSize: 18,
                //               color: Colors.white,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //     Center(
                //       child: Container(
                //         height: 40,
                //         width: 100,
                //         decoration: BoxDecoration(
                //           color: Colors.red,
                //           //border: Border.all(color: Colors.grey),
                //           borderRadius: BorderRadius.circular(10),
                //           boxShadow: [
                //             BoxShadow(
                //               color: Colors.grey.withOpacity(0.5),
                //               spreadRadius: 1,
                //               blurRadius: 5,
                //               offset: Offset(0, 3), // changes position of shadow
                //             ),
                //           ],
                //         ),
                //         child: FlatButton(
                //           shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(20.0)),
                //
                //           onPressed: ()async {
                //             //something will change
                //             setState(() {
                //               DateTime now = DateTime.now();
                //               date = now.toString();
                //               String Onlydate = new DateFormat("h:mm:ssa").format(now);
                //               outtime = '$Onlydate';
                //               print(outtime);
                //             });
                //           },
                //           child: Text("OUT",
                //             textAlign: TextAlign.center,
                //             style: GoogleFonts.openSans(
                //               fontSize: 18,
                //               color: Colors.white,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),


                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width/2.5,
                        width: MediaQuery.of(context).size.width/2.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          //border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),

                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationList(xposition: widget.loginModel.xposition,)));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10,left: 17),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // const Icon(Icons.notifications_active_sharp,
                                    //   size: 70,
                                    //   color: Color(0xff4AA0EC),
                                    // ),

                                    Image(
                                      image: AssetImage('images/notification.png'),
                                      height: 60,
                                      width: 60,
                                    ),

                                    SizedBox(height: 10,),

                                    Text("Notificaiton",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.openSans(
                                        fontSize: 15,
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // const Padding(
                              //   padding: EdgeInsets.only(top: 20, ),
                              //   child: CircleAvatar(
                              //     // backgroundColor: Colors.redAccent,
                              //     backgroundColor: Color(0xff8CA6DB),
                              //     radius: 10,
                              //     child: Text(
                              //       '0',
                              //       style: TextStyle(
                              //         color: Colors.white,
                              //         fontSize: 17,
                              //         fontWeight: FontWeight.bold,
                              //       ),),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(width: 20,),

                      Container(
                        height: MediaQuery.of(context).size.width/2.5,
                        width: MediaQuery.of(context).size.width/2.65,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          //border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),

                          onPressed: () async {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>AttendanceField(xstaff: widget.loginModel.xstaff,xposition: widget.loginModel.xposition,xsid: widget.loginModel.xsid,)));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // const Icon(FontAwesomeIcons.clipboardCheck,
                              //   size: 60,
                              //   color: Color(0xff4AA0EC),
                              // ),

                              const Image(
                                image: AssetImage('images/attendance.png'),
                                height: 60,
                                width: 60,
                              ),

                              SizedBox(height: 20,),

                              Text("Attendance",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.openSans(
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),


                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 30.0,right: 30.0, bottom: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width/2.5,
                        width: MediaQuery.of(context).size.width/2.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          //border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),

                          onPressed: ()async{


                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Leave_page(xposition: widget.loginModel.xposition,xstaff: widget.loginModel.xstaff,xsid: widget.loginModel.xsid,xbalance: xbalance,xname: widget.loginModel.xname,)));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // const Icon(FontAwesomeIcons.calendarPlus,
                              //   size: 60,
                              //   color: Color(0xff4AA0EC),
                              // ),

                              Image(
                                image: AssetImage('images/leavetour.png'),
                                height: 60,
                                width: 60,
                              ),

                              SizedBox(height: 20,),

                              Text("Leave and Tour",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.openSans(
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      SizedBox(width: 20,),

                      //
                      // Container(
                      //   height: MediaQuery.of(context).size.width/2.5,
                      //   width: MediaQuery.of(context).size.width/2.65,
                      //   decoration: BoxDecoration(
                      //     color: Colors.white,
                      //     //border: Border.all(color: Colors.grey),
                      //     borderRadius: BorderRadius.circular(20),
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: Colors.grey.withOpacity(0.5),
                      //         spreadRadius: 1,
                      //         blurRadius: 5,
                      //         offset: Offset(0, 3), // changes position of shadow
                      //       ),
                      //     ],
                      //   ),
                      //   child: FlatButton(
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(20.0)),
                      //
                      //     onPressed: (){
                      //       Navigator.push(context, MaterialPageRoute(builder: (context)=>AbsentApproval_page()));
                      //     },
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.center,
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         // const Icon(FontAwesomeIcons.calendarMinus,
                      //         //   size: 60,
                      //         //   color: Color(0xff4AA0EC),
                      //         // ),
                      //
                      //         Image(
                      //           image: AssetImage('images/absent.png'),
                      //           height: 60,
                      //           width: 60,
                      //         ),
                      //
                      //
                      //         SizedBox(height: 10,),
                      //
                      //         Text("Absence Approval",
                      //           textAlign: TextAlign.center,
                      //           style: GoogleFonts.openSans(
                      //             fontSize: 15,
                      //             color: Colors.grey,
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),

                      Container(
                        height: MediaQuery.of(context).size.width/2.5,
                        width: MediaQuery.of(context).size.width/2.65,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          //border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),

                          onPressed: (){
                            //Navigator.push(context, MaterialPageRoute(builder: (context)=>Looptry(xstaff: widget.loginModel.xstaff, xposition: widget.loginModel.xposition, xsid: widget.loginModel.xsid)));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // const Icon(Icons.sync,
                              //   size: 50,
                              //   color: Color(0xff4AA0EC),
                              // ),

                              Image(
                                image: AssetImage('images/sync.png'),
                                height: 60,
                                width: 60,
                              ),

                              SizedBox(height: 20,),

                              Text("Data Sync",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.openSans(
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 30.0,right: 30.0, bottom: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width/2.5,
                        width: MediaQuery.of(context).size.width/2.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          //border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),

                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Payslip_page(xname: widget.loginModel.xname,xempbank: widget.loginModel.xempbank,xacc: widget.loginModel.xacc, xstaff: widget.loginModel.xstaff,)));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // const Icon(FontAwesomeIcons.fileAlt,
                              //   size: 60,
                              //   color: Color(0xff4AA0EC),
                              // ),

                              Image(
                                image: AssetImage('images/payslip.png'),
                                height: 60,
                                width: 60,
                              ),


                              SizedBox(height: 20,),

                              Text("Pay Slip",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.openSans(
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      SizedBox(width: 20,),
                      //
                      // Container(
                      //   height: MediaQuery.of(context).size.width/2.5,
                      //   width: MediaQuery.of(context).size.width/2.65,
                      //   decoration: BoxDecoration(
                      //     color: Colors.white,
                      //     //border: Border.all(color: Colors.grey),
                      //     borderRadius: BorderRadius.circular(20),
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: Colors.grey.withOpacity(0.5),
                      //         spreadRadius: 1,
                      //         blurRadius: 5,
                      //         offset: Offset(0, 3), // changes position of shadow
                      //       ),
                      //     ],
                      //   ),
                      //   child: FlatButton(
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(20.0)),
                      //
                      //     onPressed: (){
                      //       Navigator.push(context, MaterialPageRoute(builder: (context)=>Sales_Homepage()));
                      //     },
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.center,
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         // const Icon(FontAwesomeIcons.sellsy,
                      //         //   size: 60,
                      //         //   color: Color(0xff4AA0EC),
                      //         // ),
                      //
                      //         Image(
                      //           image: AssetImage('images/sales.png'),
                      //           height: 60,
                      //           width: 60,
                      //         ),
                      //
                      //
                      //         SizedBox(height: 20,),
                      //
                      //         Text("Sales",
                      //           textAlign: TextAlign.center,
                      //           style: GoogleFonts.openSans(
                      //             fontSize: 15,
                      //             color: Colors.grey,
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),


                    ],
                  ),
                ),


                SizedBox(height: 20,),

              ],
            ),
          ),
          
        ),
        
      ),
    );
  }
}


