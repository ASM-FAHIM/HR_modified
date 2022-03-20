
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrandsells/data_model/leave_tour_model.dart';
import 'package:hrandsells/packages/testmodelapi.dart';
import 'package:http/http.dart' as http;

// sql@s3rv3r



Future<List<ApiSql>> fetchPost() async {
  final response =
  await http.get(Uri.parse('http://172.20.20.69/api/api.php'));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<ApiSql>((json) => ApiSql.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}


class testpage extends StatefulWidget {
  @override
  _testpageState createState() => _testpageState();
}

class _testpageState extends State<testpage> {


  Future<List<ApiSql>>? futurePost;

  //String statusdemo = "";

  changeColor(String statusdemo) {
    switch (statusdemo) {
      case "Waiting for Approval":
        return Colors.blue;

      case "Approved":
        return Colors.green;

      case "Rejected":
        return Colors.red;

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
    futurePost = fetchPost();

    fetchPost().whenComplete(() => futurePost);
    //fetchPost().whenComplete(() => statusdemo);
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
            padding: const EdgeInsets.only(
                left: 8.0, right: 16, top: 12, bottom: 12),
            child: GestureDetector(
              onTap: () {
                // print("Pressed");
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => LeaveApply_page()));
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
              padding: const EdgeInsets.only(
                  top: 20.0, right: 20, left: 20, bottom: 20),
              child: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .width / 5,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
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

                    Text("21", //Number of leave
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
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: FutureBuilder<List<ApiSql>>(
                future: futurePost,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return RefreshIndicator(
                      onRefresh: _handleRefresh,
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) =>
                            Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20.0, right: 20, left: 20),
                                    child: Container(
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .width / 2.5,
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        //border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 5,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        mainAxisAlignment: MainAxisAlignment
                                            .start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0, top: 15),
                                            child: Container(
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: changeColor(
                                                    (snapshot.data![index]
                                                        .firstName)
                                                        .toString()),
                                                //border: Border.all(color: Colors.grey),
                                                borderRadius: BorderRadius
                                                    .circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 1,
                                                    blurRadius: 5,
                                                    offset: Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                              ),

                                              child: Column(
                                                children: [
                                                  Text(
                                                    "${snapshot.data![index]
                                                        .firstName}",
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.openSans(
                                                      fontSize: 15,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    "${snapshot.data![index]
                                                        .lastName}",
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.openSans(
                                                      fontSize: 15,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),

                                            ),
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