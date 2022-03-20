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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hrandsells/data_model/notification_model.dart';
import 'package:hrandsells/home_page.dart';
import 'package:hrandsells/hr/viewNotification.dart';
import 'package:hrandsells/screen/notification_api.dart';
//import 'package:hrandsells/hr/viewNotification.dart';
import 'package:http/http.dart' as http;

class Late_NotificationList extends StatefulWidget {
  //const NotificationList({Key? key}) : super(key: key);

  Late_NotificationList({required this.xposition});
  String xposition;

  @override
  _Late_NotificationListState createState() => _Late_NotificationListState();
}

class _Late_NotificationListState extends State<Late_NotificationList> {
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


  Future<List<NotificationModel>>? futurePost;



  Future<List<NotificationModel>> fetchPost() async {
    var response= await http.post(Uri.parse('http://172.20.20.69/api/notification.php'),body:
    jsonEncode(<String, String>{
      "xposition": widget.xposition,
    })
    );



    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<NotificationModel>((json) => NotificationModel.fromJson(json)).toList();
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
        title: Text('Late Information Notification'),
        backgroundColor: Color(0xFF8CA6DB),
      ),

      body: Container(
        padding: EdgeInsets.all(20),

        child: FutureBuilder<List<NotificationModel>>(
          future: futurePost,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  child: Column(
                    children: [
                      FlatButton(
                        color: Colors.white70,
                        height: 70,
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ViewNotification(details: snapshot.data![index].xdetails)));
                        },
                        child:  Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.lightBlueAccent,
                              child: Icon(Icons.notifications_active_outlined),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            Column(
                              children: [
                                Text("${snapshot.data![index].xtitle}",
                                  style: TextStyle(fontSize: 20,),
                                  textAlign: TextAlign.start,
                                ),
                                Text("${snapshot.data![index].xsubtitle}",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            // SizedBox(
                            //   width: 100,
                            // ),

                            //Icon(Icons.delete, color: Colors.grey,),
                          ],
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