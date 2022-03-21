// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:hrandsells/data_model/notification_model.dart';
// import 'package:hrandsells/home_page.dart';
// import 'package:hrandsells/hr/viewNotification.dart';
// import 'package:hrandsells/screen/notification_api.dart';
// //import 'package:hrandsells/hr/viewNotification.dart';
// import 'package:http/http.dart' as http;
//
// class NotificationList extends StatefulWidget {
//   //const NotificationList({Key? key}) : super(key: key);
//
//   NotificationList({required this.xposition});
//   String xposition;
//
//   @override
//   _NotificationListState createState() => _NotificationListState();
// }
//
// class _NotificationListState extends State<NotificationList> {
//   // fetchnotification _noteList = fetchnotification();
//   //fetchnotification _noteList = fetchnotification();
//
//   @override
//
//   // Future<List<NotificationModel>>? futurePost;
//   //
//   // Future<List<NotificationModel>> fetchNotification() async {
//   //   var response= await http.post(Uri.parse('http://172.20.20.69/api/notification.php'),body:
//   //   jsonEncode(<String, String>{
//   //     "xposition": widget.xposition,
//   //   })
//   //   );
//   //   print(response.statusCode);
//   //   print(response.body);
//   //
//   //   if (response.statusCode == 200) {
//   //     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
//   //
//   //     return parsed.map<NotificationModel>((json) => NotificationModel.fromJson(json)).toList();
//   //   } else {
//   //     throw Exception('Failed to load album');
//   //   }
//   // }
//
//
//   Future<List<NotificationModel>>? futurePost;
//
//
//
//   Future<List<NotificationModel>> fetchPost() async {
//     var response= await http.post(Uri.parse('http://172.20.20.69/api/notification.php'),body:
//     jsonEncode(<String, String>{
//       "xposition": widget.xposition,
//     })
//     );
//
//
//
//     if (response.statusCode == 200) {
//       final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
//
//       return parsed.map<NotificationModel>((json) => NotificationModel.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load album');
//     }
//   }
//
//
//   @override
//   void initState() {
//     super.initState();
//
//     // submitData();
//     futurePost = fetchPost();
//
//     fetchPost().whenComplete(() => futurePost);
//   }
//
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Notification List'),
//         backgroundColor: Color(0xFF8CA6DB),
//       ),
//
//       body: Container(
//         padding: EdgeInsets.all(20),
//
//         child: FutureBuilder<List<NotificationModel>>(
//           future: futurePost,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (_, index) => Container(
//                   child: Column(
//                     children: [
//                       FlatButton(
//                         color: Colors.white70,
//                         height: 70,
//                         onPressed: (){
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => ViewNotification(details: snapshot.data![index].xdetails)));
//                         },
//                         child:  Row(
//                           children: [
//                             CircleAvatar(
//                               backgroundColor: Colors.lightBlueAccent,
//                               child: Icon(Icons.notifications_active_outlined),
//                             ),
//                             SizedBox(
//                               width: 100,
//                             ),
//                             Column(
//                               children: [
//                                 Text("${snapshot.data![index].xtitle}",
//                                   style: TextStyle(fontSize: 20,),
//                                   textAlign: TextAlign.start,
//                                 ),
//                                 Text("${snapshot.data![index].xsubtitle}",
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//                               ],
//                             ),
//                             // SizedBox(
//                             //   width: 100,
//                             // ),
//
//                             //Icon(Icons.delete, color: Colors.grey,),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//
//                 ),
//               );
//             } else {
//               return Center(
//                 child: Image(image: AssetImage("images/loading.gif")),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }


// // import 'dart:convert';
// //
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:hrandsells/data_model/notification_model.dart';
// // import 'package:hrandsells/home_page.dart';
// // import 'package:hrandsells/hr/viewNotification.dart';
// // import 'package:hrandsells/screen/notification_api.dart';
// // //import 'package:hrandsells/hr/viewNotification.dart';
// // import 'package:http/http.dart' as http;
// //
// // class NotificationList extends StatefulWidget {
// //   //const NotificationList({Key? key}) : super(key: key);
// //
// //   NotificationList({required this.xposition});
// //   String xposition;
// //
// //   @override
// //   _NotificationListState createState() => _NotificationListState();
// // }
// //
// // class _NotificationListState extends State<NotificationList> {
// //   // fetchnotification _noteList = fetchnotification();
// //   //fetchnotification _noteList = fetchnotification();
// //
// //   @override
// //
// //   // Future<List<NotificationModel>>? futurePost;
// //   //
// //   // Future<List<NotificationModel>> fetchNotification() async {
// //   //   var response= await http.post(Uri.parse('http://172.20.20.69/api/notification.php'),body:
// //   //   jsonEncode(<String, String>{
// //   //     "xposition": widget.xposition,
// //   //   })
// //   //   );
// //   //   print(response.statusCode);
// //   //   print(response.body);
// //   //
// //   //   if (response.statusCode == 200) {
// //   //     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
// //   //
// //   //     return parsed.map<NotificationModel>((json) => NotificationModel.fromJson(json)).toList();
// //   //   } else {
// //   //     throw Exception('Failed to load album');
// //   //   }
// //   // }
// //
// //
// //   Future<List<NotificationModel>>? futurePost;
// //
// //
// //
// //   Future<List<NotificationModel>> fetchPost() async {
// //     var response= await http.post(Uri.parse('http://172.20.20.69/api/notification.php'),body:
// //     jsonEncode(<String, String>{
// //       "xposition": widget.xposition,
// //     })
// //     );
// //
// //
// //
// //     if (response.statusCode == 200) {
// //       final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
// //
// //       return parsed.map<NotificationModel>((json) => NotificationModel.fromJson(json)).toList();
// //     } else {
// //       throw Exception('Failed to load album');
// //     }
// //   }
// //
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //
// //     // submitData();
// //     futurePost = fetchPost();
// //
// //     fetchPost().whenComplete(() => futurePost);
// //   }
// //
// //
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Notification List'),
// //         backgroundColor: Color(0xFF8CA6DB),
// //       ),
// //
// //       body: Container(
// //         padding: EdgeInsets.all(20),
// //
// //         child: FutureBuilder<List<NotificationModel>>(
// //           future: futurePost,
// //           builder: (context, snapshot) {
// //             if (snapshot.hasData) {
// //               return ListView.builder(
// //                 itemCount: snapshot.data!.length,
// //                 itemBuilder: (_, index) => Container(
// //                   child: Column(
// //                     children: [
// //                       FlatButton(
// //                         color: Colors.white70,
// //                         height: 70,
// //                         onPressed: (){
// //                           Navigator.push(context, MaterialPageRoute(builder: (context) => ViewNotification(details: snapshot.data![index].xdetails)));
// //                         },
// //                         child:  Row(
// //                           children: [
// //                             CircleAvatar(
// //                               backgroundColor: Colors.lightBlueAccent,
// //                               child: Icon(Icons.notifications_active_outlined),
// //                             ),
// //                             SizedBox(
// //                               width: 100,
// //                             ),
// //                             Column(
// //                               children: [
// //                                 Text("${snapshot.data![index].xtitle}",
// //                                   style: TextStyle(fontSize: 20,),
// //                                   textAlign: TextAlign.start,
// //                                 ),
// //                                 Text("${snapshot.data![index].xsubtitle}",
// //                                   style: TextStyle(fontSize: 15),
// //                                 ),
// //                               ],
// //                             ),
// //                             // SizedBox(
// //                             //   width: 100,
// //                             // ),
// //
// //                             //Icon(Icons.delete, color: Colors.grey,),
// //                           ],
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //
// //                 ),
// //               );
// //             } else {
// //               return Center(
// //                 child: Image(image: AssetImage("images/loading.gif")),
// //               );
// //             }
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:hrandsells/data_model/notification_model.dart';
// import 'package:hrandsells/data_model/notification_model/leave&tour_notification_model.dart';
// import 'package:hrandsells/home_page.dart';
// import 'package:hrandsells/hr/viewNotification.dart';
// import 'package:hrandsells/screen/notification_api.dart';
// //import 'package:hrandsells/hr/viewNotification.dart';
// import 'package:http/http.dart' as http;
//
// class LeaveTour_NotificationList extends StatefulWidget {
//   //const NotificationList({Key? key}) : super(key: key);
//
//   LeaveTour_NotificationList({required this.xposition});
//   String xposition;
//
//   @override
//   _LeaveTour_NotificationListState createState() => _LeaveTour_NotificationListState();
// }
//
// class _LeaveTour_NotificationListState extends State<LeaveTour_NotificationList> {
//   // fetchnotification _noteList = fetchnotification();
//   //fetchnotification _noteList = fetchnotification();
//
//   @override
//
//   // Future<List<NotificationModel>>? futurePost;
//   //
//   // Future<List<NotificationModel>> fetchNotification() async {
//   //   var response= await http.post(Uri.parse('http://172.20.20.69/api/notification.php'),body:
//   //   jsonEncode(<String, String>{
//   //     "xposition": widget.xposition,
//   //   })
//   //   );
//   //   print(response.statusCode);
//   //   print(response.body);
//   //
//   //   if (response.statusCode == 200) {
//   //     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
//   //
//   //     return parsed.map<NotificationModel>((json) => NotificationModel.fromJson(json)).toList();
//   //   } else {
//   //     throw Exception('Failed to load album');
//   //   }
//   // }
//
//
//   Future<List<LeaveTourNotificationModel>>? futurePost;
//
//
//
//   Future<List<LeaveTourNotificationModel>> fetchPost() async {
//     var response= await http.post(Uri.parse('http://172.20.20.69/api/leavenotification.php'),body:
//     jsonEncode(<String, String>{
//       "xposition": widget.xposition,
//     })
//     );
//
//
//
//     if (response.statusCode == 200) {
//       final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
//
//       return parsed.map<LeaveTourNotificationModel>((json) => LeaveTourNotificationModel.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load album');
//     }
//   }
//
//
//   @override
//   void initState() {
//     super.initState();
//
//     // submitData();
//     futurePost = fetchPost();
//
//     fetchPost().whenComplete(() => futurePost);
//   }
//
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Leave & Tour Notification'),
//         backgroundColor: Color(0xFF8CA6DB),
//       ),
//
//       body: Container(
//         padding: EdgeInsets.all(20),
//
//         child: FutureBuilder<List<LeaveTourNotificationModel>>(
//           future: futurePost,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (_, index) => Container(
//                   child: Column(
//                     children: [
//                       FlatButton(
//                         color: Colors.white70,
//                         height: 70,
//                         onPressed: (){
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => ViewNotification(details: snapshot.data![index].status)));
//                         },
//                         child:  Row(
//                           children: [
//                             CircleAvatar(
//                               backgroundColor: Colors.lightBlueAccent,
//                               child: Icon(Icons.notifications_active_outlined),
//                             ),
//                             SizedBox(
//                               width: 100,
//                             ),
//                             Column(
//                               children: [
//                                 Text("${snapshot.data![index].status}",
//                                   style: TextStyle(fontSize: 20,),
//                                   textAlign: TextAlign.start,
//                                 ),
//                                 Text("${snapshot.data![index].applyDate.date}",
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//                               ],
//                             ),
//                             // SizedBox(
//                             //   width: 100,
//                             // ),
//
//                             //Icon(Icons.delete, color: Colors.grey,),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//
//                 ),
//               );
//             } else {
//               return Center(
//                 child: Image(image: AssetImage("images/loading.gif")),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }



// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:hrandsells/data_model/notification_model.dart';
// import 'package:hrandsells/home_page.dart';
// import 'package:hrandsells/hr/viewNotification.dart';
// import 'package:hrandsells/screen/notification_api.dart';
// //import 'package:hrandsells/hr/viewNotification.dart';
// import 'package:http/http.dart' as http;
//
// class NotificationList extends StatefulWidget {
//   //const NotificationList({Key? key}) : super(key: key);
//
//   NotificationList({required this.xposition});
//   String xposition;
//
//   @override
//   _NotificationListState createState() => _NotificationListState();
// }
//
// class _NotificationListState extends State<NotificationList> {
//   // fetchnotification _noteList = fetchnotification();
//   //fetchnotification _noteList = fetchnotification();
//
//   @override
//
//   // Future<List<NotificationModel>>? futurePost;
//   //
//   // Future<List<NotificationModel>> fetchNotification() async {
//   //   var response= await http.post(Uri.parse('http://172.20.20.69/api/notification.php'),body:
//   //   jsonEncode(<String, String>{
//   //     "xposition": widget.xposition,
//   //   })
//   //   );
//   //   print(response.statusCode);
//   //   print(response.body);
//   //
//   //   if (response.statusCode == 200) {
//   //     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
//   //
//   //     return parsed.map<NotificationModel>((json) => NotificationModel.fromJson(json)).toList();
//   //   } else {
//   //     throw Exception('Failed to load album');
//   //   }
//   // }
//
//
//   Future<List<NotificationModel>>? futurePost;
//
//
//
//   Future<List<NotificationModel>> fetchPost() async {
//     var response= await http.post(Uri.parse('http://172.20.20.69/api/notification.php'),body:
//     jsonEncode(<String, String>{
//       "xposition": widget.xposition,
//     })
//     );
//
//
//
//     if (response.statusCode == 200) {
//       final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
//
//       return parsed.map<NotificationModel>((json) => NotificationModel.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load album');
//     }
//   }
//
//
//   @override
//   void initState() {
//     super.initState();
//
//     // submitData();
//     futurePost = fetchPost();
//
//     fetchPost().whenComplete(() => futurePost);
//   }
//
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Notification List'),
//         backgroundColor: Color(0xFF8CA6DB),
//       ),
//
//       body: Container(
//         padding: EdgeInsets.all(20),
//
//         child: FutureBuilder<List<NotificationModel>>(
//           future: futurePost,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (_, index) => Container(
//                   child: Column(
//                     children: [
//                       FlatButton(
//                         color: Colors.white70,
//                         height: 70,
//                         onPressed: (){
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => ViewNotification(details: snapshot.data![index].xdetails)));
//                         },
//                         child:  Row(
//                           children: [
//                             CircleAvatar(
//                               backgroundColor: Colors.lightBlueAccent,
//                               child: Icon(Icons.notifications_active_outlined),
//                             ),
//                             SizedBox(
//                               width: 100,
//                             ),
//                             Column(
//                               children: [
//                                 Text("${snapshot.data![index].xtitle}",
//                                   style: TextStyle(fontSize: 20,),
//                                   textAlign: TextAlign.start,
//                                 ),
//                                 Text("${snapshot.data![index].xsubtitle}",
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//                               ],
//                             ),
//                             // SizedBox(
//                             //   width: 100,
//                             // ),
//
//                             //Icon(Icons.delete, color: Colors.grey,),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//
//                 ),
//               );
//             } else {
//               return Center(
//                 child: Image(image: AssetImage("images/loading.gif")),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hrandsells/data_model/notification_model.dart';
import 'package:hrandsells/data_model/notification_model/leave&tour_notification_model.dart';
import 'package:hrandsells/home_page.dart';
import 'package:hrandsells/hr/viewNotification.dart';
import 'package:hrandsells/screen/notification_api.dart';
//import 'package:hrandsells/hr/viewNotification.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Early_Leave_NotificationList extends StatefulWidget {
  //const NotificationList({Key? key}) : super(key: key);

  Early_Leave_NotificationList({required this.xposition});
  String xposition;

  @override
  _Early_Leave_NotificationListState createState() => _Early_Leave_NotificationListState();
}

class _Early_Leave_NotificationListState extends State<Early_Leave_NotificationList> {
  // fetchnotification _noteList = fetchnotification();
  //fetchnotification _noteList = fetchnotification();

  @override

  // Future<List<NotificationModel>>? futurePost;
  //
  // Future<List<NotificationModel>> fetchNotification() async {
  //   var response= await http.post(Uri.parse('http://172.20.20.69/api/notification.php'),body:
  //   jsonEncode(<String, String>{
  //     "xposition": widget.xposition,
  //   })
  //   );
  //   print(response.statusCode);
  //   print(response.body);
  //
  //   if (response.statusCode == 200) {
  //     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
  //
  //     return parsed.map<NotificationModel>((json) => NotificationModel.fromJson(json)).toList();
  //   } else {
  //     throw Exception('Failed to load album');
  //   }
  // }


  Future<List<LeaveTourNotificationModel>>? futurePost;



  Future<List<LeaveTourNotificationModel>> fetchPost() async {
    var response= await http.post(Uri.parse('http://172.20.20.69/api/leavenotification.php'),body:
    jsonEncode(<String, String>{
      "xposition": widget.xposition,
    })
    );



    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<LeaveTourNotificationModel>((json) => LeaveTourNotificationModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }


  @override
  void initState() {
    super.initState();

    // submitData();
    futurePost = fetchPost();

    fetchPost().whenComplete(() => futurePost);
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Early Leave Notification'),
        backgroundColor: Color(0xFF8CA6DB),
      ),

      body: Container(
        padding: EdgeInsets.all(20),

        child: FutureBuilder<List<LeaveTourNotificationModel>>(
          future: futurePost,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  child: Column(
                    children: [
                      // Icon(Icons.notifications_active_outlined),
                      // SizedBox(
                      //   width: 100,
                      // ),

                      Card(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 36.0, left: 6.0, right: 6.0, bottom: 6.0),
                          child: ExpansionTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text((DateFormat("dd-MM-yyyy").format(DateTime.parse((snapshot.data![index].applyDate.date).toString()))).toString()),
                                    //Text(" ${snapshot.data![index].typeOfApplication}"),
                                    //Text(" ${snapshot.data![index].status}")
                                  ],
                                ),
                                Text("Early Leave")
                              ],
                            ),
                            children: <Widget>[
                              Text("Date : "+(DateFormat("dd-MM-yyyy").format(DateTime.parse((snapshot.data![index].fromDate.date).toString()))).toString(),
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text("Day : "+(DateFormat("dd-MM-yyyy").format(DateTime.parse((snapshot.data![index].toDate.date).toString()))).toString(),
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text("IN Time : "+"${snapshot.data![index].appliedDayS.toString()}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text("OUT Time : "+"${snapshot.data![index].approvedDayS.toString()}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text("Working Hour : "+"${snapshot.data![index].approver.toString()}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text("Status : "+"${snapshot.data![index].status.toString()}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text("Approval Status : "+"${snapshot.data![index].approvedRecommendedBy.toString()}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),
                              ),


                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
              );
            } else {
              return Center(
                child: Image(image: AssetImage("images/loading.gif")),
              );
            }
          },
        ),
      ),
    );
  }
}

//
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:hrandsells/data_model/notification_model.dart';
// import 'package:hrandsells/home_page.dart';
// import 'package:hrandsells/hr/viewNotification.dart';
// import 'package:hrandsells/screen/notification_api.dart';
// //import 'package:hrandsells/hr/viewNotification.dart';
// import 'package:http/http.dart' as http;
//
// class Early_Leave_NotificationList extends StatefulWidget {
//   //const NotificationList({Key? key}) : super(key: key);
//
//   Early_Leave_NotificationList({required this.xposition});
//   String xposition;
//
//   @override
//   _Early_Leave_NotificationListState createState() => _Early_Leave_NotificationListState();
// }
//
// class _Early_Leave_NotificationListState extends State<Early_Leave_NotificationList> {
//   // fetchnotification _noteList = fetchnotification();
//   //fetchnotification _noteList = fetchnotification();
//
//   @override
//
//   // Future<List<NotificationModel>>? futurePost;
//   //
//   // Future<List<NotificationModel>> fetchNotification() async {
//   //   var response= await http.post(Uri.parse('http://172.20.20.69/api/notification.php'),body:
//   //   jsonEncode(<String, String>{
//   //     "xposition": widget.xposition,
//   //   })
//   //   );
//   //   print(response.statusCode);
//   //   print(response.body);
//   //
//   //   if (response.statusCode == 200) {
//   //     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
//   //
//   //     return parsed.map<NotificationModel>((json) => NotificationModel.fromJson(json)).toList();
//   //   } else {
//   //     throw Exception('Failed to load album');
//   //   }
//   // }
//
//
//   Future<List<NotificationModel>>? futurePost;
//
//
//
//   Future<List<NotificationModel>> fetchPost() async {
//     var response= await http.post(Uri.parse('http://172.20.20.69/api/notification.php'),body:
//     jsonEncode(<String, String>{
//       "xposition": widget.xposition,
//     })
//     );
//
//
//
//     if (response.statusCode == 200) {
//       final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
//
//       return parsed.map<NotificationModel>((json) => NotificationModel.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load album');
//     }
//   }
//
//
//   @override
//   void initState() {
//     super.initState();
//
//     // submitData();
//     futurePost = fetchPost();
//
//     fetchPost().whenComplete(() => futurePost);
//   }
//
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Early Leave Information Notification'),
//         backgroundColor: Color(0xFF8CA6DB),
//       ),
//
//       body: Container(
//         padding: EdgeInsets.all(20),
//
//         child: FutureBuilder<List<NotificationModel>>(
//           future: futurePost,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (_, index) => Container(
//                   child: Column(
//                     children: [
//                       FlatButton(
//                         color: Colors.white70,
//                         height: 70,
//                         onPressed: (){
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => ViewNotification(details: snapshot.data![index].xdetails)));
//                         },
//                         child:  Row(
//                           children: [
//                             CircleAvatar(
//                               backgroundColor: Colors.lightBlueAccent,
//                               child: Icon(Icons.notifications_active_outlined),
//                             ),
//                             SizedBox(
//                               width: 100,
//                             ),
//                             Column(
//                               children: [
//                                 Text("${snapshot.data![index].xtitle}",
//                                   style: TextStyle(fontSize: 20,),
//                                   textAlign: TextAlign.start,
//                                 ),
//                                 Text("${snapshot.data![index].xsubtitle}",
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//                               ],
//                             ),
//                             // SizedBox(
//                             //   width: 100,
//                             // ),
//
//                             //Icon(Icons.delete, color: Colors.grey,),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//
//                 ),
//               );
//             } else {
//               return Center(
//                 child: Image(image: AssetImage("images/loading.gif")),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }