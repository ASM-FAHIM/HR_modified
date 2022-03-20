// import 'dart:async';
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hrandsells/data_model/leave_tour_model.dart';
// import 'package:http/http.dart' as http;
//
// import 'leave_tour_apply.dart';
//
//
// Future<List<LeaveTourModel>> fetchPost() async {
//   final response =
//   await http.get(Uri.parse('http://flutterapi.brotherdev.com/api.php'));
//
//   if (response.statusCode == 200) {
//     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
//
//     return parsed.map<LeaveTourModel>((json) => LeaveTourModel.fromJson(json)).toList();
//   } else {
//     throw Exception('Failed to load album');
//   }
// }
//
//
// class Leave_page extends StatefulWidget {
//   @override
//   _Leave_pageState createState() => _Leave_pageState();
// }
//
// class _Leave_pageState extends State<Leave_page> {
//
//
//   Future<List<LeaveTourModel>>? futurePost;
//
//   //String statusdemo = "";
//
//   changeColor(String statusdemo){
//
//     switch(statusdemo){
//       case "Waiting for Approval":
//         return Colors.blue;
//
//       case "Approved":
//         return Colors.green;
//
//       case "Rejected":
//         return Colors.red;
//
//       default:
//         return Colors.purple;
//
//     }
//     //
//     // if(statusdemo == "Waiting for Approval"){
//     //   print(statusdemo);
//     //     return Colors.grey;
//     // }
//     // else if(statusdemo == "Approved"){
//     //   print(statusdemo);
//     //   return Colors.green;
//     // }
//     // else if(statusdemo == "Rejected"){
//     //   print(statusdemo);
//     //   return Colors.red;
//     // }
//
//   }
//
//
//
//   @override
//   void initState() {
//     super.initState();
//     futurePost = fetchPost();
//
//     fetchPost().whenComplete(() => futurePost);
//     //fetchPost().whenComplete(() => statusdemo);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Color(0xFF8CA6DB),
//             automaticallyImplyLeading: true,
//             title: Center(
//                 child: Text("Leave and Tour",
//                   textAlign: TextAlign.center,
//                   style: GoogleFonts.openSans(
//                     fontSize: 20,
//                   ),
//                 )
//             ),
//
//             actions: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 8.0,right: 16,top: 12,bottom: 12),
//                 child: GestureDetector(
//                   onTap: (){
//                     print("Pressed");
//                     Navigator.push(context, MaterialPageRoute(builder: (context)=>LeaveApply_page()));
//                   },
//                   child: Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.black),
//                       ),
//                       child: Icon(Icons.add)
//                   ),
//                 ),
//               ),
//             ],
//
//           ),
//           body: FutureBuilder<List<LeaveTourModel>>(
//             future: futurePost,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return RefreshIndicator(
//                   onRefresh: _handleRefresh,
//                   child: ListView.builder(
//                     itemCount: snapshot.data!.length,
//                     itemBuilder: (_, index) => Container(
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(top: 20.0,right: 20,left: 20),
//                             child: Container(
//                               height: MediaQuery.of(context).size.width/2.5,
//                               width: MediaQuery.of(context).size.width,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 //border: Border.all(color: Colors.grey),
//                                 borderRadius: BorderRadius.circular(20),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.grey.withOpacity(0.5),
//                                     spreadRadius: 1,
//                                     blurRadius: 5,
//                                     offset: Offset(0, 3), // changes position of shadow
//                                   ),
//                                 ],
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 20.0,top: 15),
//                                     child: Container(
//                                       padding: const EdgeInsets.all(10),
//                                       decoration: BoxDecoration(
//                                         color: changeColor((snapshot.data![index].aprovalstatus).toString()),
//                                         //border: Border.all(color: Colors.grey),
//                                         borderRadius: BorderRadius.circular(10),
//                                         boxShadow: [
//                                           BoxShadow(
//                                             color: Colors.grey.withOpacity(0.5),
//                                             spreadRadius: 1,
//                                             blurRadius: 5,
//                                             offset: Offset(0, 3), // changes position of shadow
//                                           ),
//                                         ],
//                                       ),
//
//                                       child: Text("${snapshot.data![index].aprovalstatus}",
//                                         textAlign: TextAlign.center,
//                                         style: GoogleFonts.openSans(
//                                           fontSize: 15,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//
//                                     ),
//                                   ),
//
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 10.0,left: 20),
//                                         child: Column(
//                                           //mainAxisAlignment: MainAxisAlignment.start,
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: [
//                                             Text("${snapshot.data![index].leaveType}",
//                                               textAlign: TextAlign.left,
//                                               style: GoogleFonts.openSans(
//                                                 fontSize: 20,
//                                                 color: Colors.grey,
//                                               ),
//                                             ),
//
//                                             Text("Approved By",
//                                               textAlign: TextAlign.left,
//                                               style: GoogleFonts.openSans(
//                                                 fontSize: 15,
//                                                 color: Colors.grey,
//                                               ),
//                                             ),
//
//                                             Text("Soyaib Sharafi",
//                                               textAlign: TextAlign.left,
//                                               style: GoogleFonts.openSans(
//                                                 fontSize: 15,
//                                                 color: Colors.grey,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//
//                                       SizedBox(width: 60,),
//
//                                       Column(
//                                         children: [
//                                           Text("${snapshot.data![index].fromDate}" + " - ",
//                                             textAlign: TextAlign.center,
//                                             style: GoogleFonts.openSans(
//                                               fontSize: 15,
//                                               color: Colors.grey,
//                                             ),
//                                           ),
//
//                                           Text("${snapshot.data![index].toDate}",
//                                             textAlign: TextAlign.center,
//                                             style: GoogleFonts.openSans(
//                                               fontSize: 15,
//                                               color: Colors.grey,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//
//                                     ],
//                                   ),
//
//                                 ],
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 20,)
//                         ],
//                       ),
//
//                     ),
//                   ),
//                 );
//               } else {
//                 return Center(
//                   child: Image(image: AssetImage("images/loading.gif")),
//                 );
//               }
//             },
//           ),
//         ),
//     );
//   }
//
//   Future<Null> _handleRefresh() async {
//     await new Future.delayed(new Duration(seconds: 3));
//
//     setState(() {
//       futurePost;
//     });
//
//     return null;
//   }
//
// }



import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrandsells/data_model/leave_tour_model.dart';
import 'package:hrandsells/data_model/smallapi/appliedleavemodel.dart';
import 'package:hrandsells/data_model/xyearperdate.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'leave_tour_apply.dart';



class Leave_page extends StatefulWidget {
  @override
  _Leave_pageState createState() => _Leave_pageState();

  Leave_page({required this.xposition, required this.xstaff, required this.xsid, required this.xbalance,required this.xname});
  String xposition;
  String xstaff;
  String xsid;
  String xbalance;
  String xname;
  //LoginModel xsid;

}

class _Leave_pageState extends State<Leave_page> {


  Future<List<LeaveandTourModel>>? futurePost;

  int leave_remain = 21;
  //
  // late XbalanceModel leave_remain1;
  // String xbalance = " ";
  //
  // Future<String>  getAPIDATA() async {
  //
  //   http.Response response = await http.post(Uri.parse('http://172.20.20.69/api/leaveandtour.php'),
  //       body:jsonEncode(<String, String>{
  //         "xstaff": widget.xstaff,
  //         "xtypeleave": "Annual Leave"
  //       })
  //   );
  //
  //   print("Body:"+response.body);
  //   print(response.statusCode);
  //
  //   leave_remain1 = xbalanceModelFromJson(response.body);
  //   print("Test:"+leave_remain1.xbalance);
  //
  //   xbalance = leave_remain1.xbalance;
  //
  //   return '';
  // }


  late AppliedLeaveModel appliedleave;
  String appleave = " ";

  Future<String>  getappleavedata() async {

    http.Response response = await http.post(Uri.parse('http://172.20.20.69/api/smallAPI/appliedleave.php'),
        body:jsonEncode(<String, String>{
          "xstaff": widget.xstaff,
        })
    );

    print("Body:"+response.body);
    print(response.statusCode);

    appliedleave = appliedLeaveModelFromJson(response.body);


    //appleave = appliedleave.appliedleave;

    if(appliedleave.appliedleave == null){
      appleave = "0";
      //print("Test:"+appliedleave.appliedleave);
      print("Applied Leave:"+appleave);

    }
    else{
      appleave = appliedleave.appliedleave;
    }

    return '';
  }



  Future<List<LeaveandTourModel>> fetchPost() async {
    var response= await http.post(Uri.parse('http://172.20.20.69/api/leaveandtour.php'),body:
    jsonEncode(<String, String>{
      "xposition": widget.xposition,
    })
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<LeaveandTourModel>((json) => LeaveandTourModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  //String statusdemo = "";

  changeColor(String statusdemo){

    switch(statusdemo){
      case "Applied":
        return Color(0XFF7FE5EA);

      case "Confirmed":
        return Colors.green;

      case "Rejected":
        return Colors.red;

      case "Recommended":
        return Color(0XFF5E9CF9);


      default:
        return Colors.purple;

    }
    //
    // if(statusdemo == "Waiting for Approval"){
    //   print(statusdemo);
    //     return Colors.grey;
    // }
    // else if(statusdemo == "Approved"){
    //   print(statusdemo);
    //   return Colors.green;
    // }
    // else if(statusdemo == "Rejected"){
    //   print(statusdemo);
    //   return Colors.red;
    // }

  }




  @override
  void initState() {
    super.initState();

    // submitData();
    //leavedata().whenComplete(() => leave_remain);
    futurePost = fetchPost();
    // getAPIDATA();
    getappleavedata();

    fetchPost().whenComplete(() => futurePost);
    // getAPIDATA().whenComplete(() => xbalance);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8CA6DB),
        automaticallyImplyLeading: true,
        title: Center(
            child: Text("Leave and Tour",
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                fontSize: 20,
              ),
            )
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 16,top: 12,bottom: 12),
            child: GestureDetector(
              onTap: (){
                print("Pressed");
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LeaveApply_page(xstaff: widget.xstaff,xposition: widget.xposition,xsid: widget.xsid,leave_avail: widget.xbalance,xname: widget.xname, appleave: appleave,)));
                //submitData();
              },
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Icon(Icons.add)
              ),
            ),
          ),
        ],

      ),


      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0,right: 20,left: 20,bottom: 20),
              child: Container(
                height: MediaQuery.of(context).size.width/5,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    //SizedBox(height: 20,),

                    Text(widget.xbalance, //Number of leave
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text("Leave Remaining",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),


                  ],
                ),
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder<List<LeaveandTourModel>>(
                future: futurePost,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return RefreshIndicator(
                      onRefresh: _handleRefresh,
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0,right: 20,left: 20),
                                child: Container(
                                  height: MediaQuery.of(context).size.width/2.5,
                                  width: MediaQuery.of(context).size.width,
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
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20.0,top: 15),
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: changeColor((snapshot.data![index].xstatus).toString()),
                                            //border: Border.all(color: Colors.grey),
                                            borderRadius: BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: 1,
                                                blurRadius: 5,
                                                offset: Offset(0, 3), // changes position of shadow
                                              ),
                                            ],
                                          ),

                                          child: Text("${snapshot.data![index].xstatus}",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.openSans(
                                              fontSize: 15,
                                              color: Colors.white,
                                            ),
                                          ),

                                        ),
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 10.0,left: 20),
                                            child: Column(
                                              //mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("${snapshot.data![index].xtypeleave}",
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.openSans(
                                                    fontSize: 20,
                                                    color: Colors.grey,
                                                  ),
                                                ),

                                                Text("Approved By",
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.openSans(
                                                    fontSize: 15,
                                                    color: Colors.grey,
                                                  ),
                                                ),

                                                Text(widget.xsid,
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.openSans(
                                                    fontSize: 15,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          SizedBox(width: 60,),

                                          Column(
                                            children: [
                                              Text(DateFormat("yyyy-MM-dd").format((snapshot.data![index].xdatefrom.date)) + " - ",
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.openSans(
                                                  fontSize: 15,
                                                  color: Colors.grey,
                                                ),
                                              ),

                                              //Text("${snapshot.data![index].xdateto.date}",
                                              Text(DateFormat("yyyy-MM-dd").format((snapshot.data![index].xdateto.date)),
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.openSans(
                                                  fontSize: 15,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),

                                        ],
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,)
                            ],
                          ),

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
          ],
        ),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    await new Future.delayed(new Duration(seconds: 3));

    setState(() {
      futurePost;
    });

    return null;
  }

}


