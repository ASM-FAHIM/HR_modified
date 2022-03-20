import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrandsells/report/attendance_report.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class AttendanceField extends StatefulWidget {
  //const AttendanceField({Key? key}) : super(key: key);

  AttendanceField({required this.xstaff, required this.xposition,required this.xsid});
  String xstaff;
  String xposition;
  String xsid;

  @override
  _AttendanceFieldState createState() => _AttendanceFieldState();
}

class _AttendanceFieldState extends State<AttendanceField> {

  DateTime now = DateTime.now();
  String dropdownValue = 'Pick';
  String _fromDate = '' ;
  String _toDate = '' ;
  var initialDate;
  var firstDate;
  var lastDate;

  String intime = '';
  String outtime = '';
  bool pressAttention = false;
  bool pressAttention1 = false;
  late String _currentAddress =" ";
  late String _currentAddressout =" ";
  String date = DateFormat("yyyy-MM-dd").format(DateTime.now());



  Future<void> getLocationin() async {

    LocationPermission permission;
    permission = await Geolocator.requestPermission();

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



  void _showFromDatePicker() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2021),
        lastDate: new DateTime(2023)
    );

    if(picked != null) setState(() => _fromDate = picked.toString());
  }


  void _showToDatePicker() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2021),
        lastDate: new DateTime(2023)
    );


    if(picked != null) setState(() => _toDate = picked.toString());
  }




  submitData( invalue, outvalue, inlocation,outlocation) async{

    print(invalue);
    print(outvalue);
    print(inlocation);
    print(outlocation);



    var response= await http.post(Uri.parse('http://172.20.20.69/api/attendencetemp.php'),body:
    jsonEncode(<String, String>{
      "xposition": "2125",
      "xtimein":"2022-03-07 09:01:35.000",
      "xmodel":"B@N"
    })
    );
    var data = response.body;
    // print (data);
    print ("ii"+response.body);
    //print(dvalue);

    // if(response.statusCode==201){
    //   String responseString= response.body;
    //   leaveTourModelFromJson(responseString);
    // }
    // else return null;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8CA6DB),
        title: Center(
            child: Text("Attendance",
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                fontSize: 20,
              ),
            )
        ),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Column(
            children: <Widget>[

              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Container(
              //     height: 150,
              //     width: MediaQuery.of(context).size.width,
              //     // decoration: BoxDecoration(
              //     //   borderRadius: BorderRadius.circular(10),
              //     //   color: Colors.white,
              //     //   border: Border.all(color: const Color(0xFFf4ad5e)),
              //     //
              //     // ),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //         FlatButton(
              //           minWidth: MediaQuery.of(context).size.width/3,
              //           color: pressAttention ? Colors.green : Colors.white10,
              //           onPressed: () {
              //             //something will change
              //             getLocationin();
              //             setState(() {
              //               DateTime now = DateTime.now();
              //               date = now.toString();
              //               String Onlydate = new DateFormat("h:mm:ssa").format(now);
              //               intime = '$Onlydate';
              //               pressAttention = !pressAttention;
              //             });
              //             print(intime);
              //           },
              //           child: Column(
              //             children: [
              //               Text("IN",
              //                 textAlign: TextAlign.center,
              //                 style: GoogleFonts.openSans(
              //                   fontSize: 15,
              //                   fontWeight: FontWeight.bold,
              //                   color: pressAttention ? Colors.black : Colors.black,
              //                 ),
              //               ),
              //
              //               SizedBox(width: 20,),
              //
              //               Text("$intime",
              //                 textAlign: TextAlign.center,
              //                 style: GoogleFonts.openSans(
              //                   fontSize: 15,
              //                   color: pressAttention ? Colors.black : Colors.white,
              //                 ),
              //               ),
              //
              //               Text(_currentAddress,
              //                 textAlign: TextAlign.center,
              //                 style: GoogleFonts.openSans(
              //                   fontSize: 15,
              //                   color: pressAttention ? Colors.black : Colors.white,
              //                 ),
              //               ),
              //
              //
              //
              //             ],
              //           ),
              //         ),
              //
              //         // SizedBox(width: 15,),
              //         //
              //         // Divider(thickness: 1,color: Colors.red,),
              //
              //         // SizedBox(width: 15,),
              //
              //         FlatButton(
              //           minWidth: MediaQuery.of(context).size.width/3,
              //           color: pressAttention1 ? Colors.red : Colors.white,
              //           onPressed: ()async {
              //             //something will change
              //             getLocationout();
              //             setState(() {
              //               DateTime now = DateTime.now();
              //               date = now.toString();
              //               String Onlydate = new DateFormat("h:mm:ssa").format(now);
              //               outtime = '$Onlydate';
              //               pressAttention1 = !pressAttention1;
              //               print(outtime);
              //             });
              //           },
              //           child: Column(
              //             children: [
              //               Text("OUT",
              //                 textAlign: TextAlign.center,
              //                 style: GoogleFonts.openSans(
              //                   fontSize: 15,
              //                   fontWeight: FontWeight.bold,
              //                   color: Colors.black,
              //                 ),
              //               ),
              //
              //               SizedBox(width: 20,),
              //
              //               Text("$outtime",
              //                 textAlign: TextAlign.center,
              //                 style: GoogleFonts.openSans(
              //                   fontSize: 15,
              //                   color: pressAttention1 ? Colors.black : Colors.white,
              //                 ),
              //               ),
              //
              //               Text(_currentAddressout,
              //                 textAlign: TextAlign.center,
              //                 style: GoogleFonts.openSans(
              //                   fontSize: 15,
              //                   color: pressAttention1 ? Colors.black : Colors.white,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              //from date View

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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //
                      // SizedBox(height: 20,),
                      //
                      // Text("21", //Number of leave
                      //   textAlign: TextAlign.center,
                      //   style: GoogleFonts.openSans(
                      //     fontSize: 25,
                      //     color: Colors.grey,
                      //   ),
                      // ),
                      //
                      // Text("Leave Balance",
                      //   textAlign: TextAlign.center,
                      //   style: GoogleFonts.openSans(
                      //     fontSize: 15,
                      //     color: Colors.grey,
                      //   ),
                      // ),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(10),
                          //   color: Colors.white,
                          //   border: Border.all(color: const Color(0xFFf4ad5e)),
                          //
                          // ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FlatButton(
                                minWidth: MediaQuery.of(context).size.width/3,
                                color: pressAttention ? Colors.green : Colors.white10,
                                onPressed: () async {
                                  //something will change
                                  getLocationin();



                                  setState(()  {
                                    DateTime now = DateTime.now();
                                    date = now.toString();
                                    String Onlydate = new DateFormat("yyyy h:mm:ssa").format(now);
                                    intime = '$Onlydate';
                                    pressAttention = !pressAttention;
                                  });


                                  var response= await http.post(Uri.parse('http://172.20.20.69/api/attendencetemp.php'),body:
                                  jsonEncode(<String, String>{
                                    "xposition": widget.xposition,
                                    "xtimein":intime,
                                    "xmodel":"B@N"
                                  })
                                  );

                                  print(response.statusCode);

                                  print(intime);

                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text("IN Time Saved",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ));

                                },
                                child: Column(
                                  children: [
                                    Text("IN",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.openSans(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: pressAttention ? Colors.black : Colors.black,
                                      ),
                                    ),

                                    SizedBox(width: 20,),

                                    Text("$intime",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.openSans(
                                        fontSize: 15,
                                        color: pressAttention ? Colors.black : Colors.white,
                                      ),
                                    ),

                                    Text(_currentAddress,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.openSans(
                                        fontSize: 15,
                                        color: pressAttention ? Colors.black : Colors.white,
                                      ),
                                    ),



                                  ],
                                ),
                              ),


                              FlatButton(
                                minWidth: MediaQuery.of(context).size.width/3,
                                color: pressAttention1 ? Colors.red : Colors.white,
                                onPressed: ()async {
                                  //something will change
                                  getLocationout();
                                  setState(() {
                                    DateTime now = DateTime.now();
                                    date = now.toString();
                                    String Onlydate = new DateFormat("yyyy h:mm:ssa").format(now);
                                    outtime = '$Onlydate';
                                    pressAttention1 = !pressAttention1;
                                    print(outtime);

                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text("OUT Time saved",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ));
                                  });

                                  var response= await http.post(Uri.parse('http://172.20.20.69/api/attendencetemp.php'),body:
                                  jsonEncode(<String, String>{
                                    "xposition": widget.xposition,
                                    "xtimein":outtime,
                                    "xmodel":"B@N"
                                  })
                                  );

                                  print(response.statusCode);

                                },
                                child: Column(
                                  children: [
                                    Text("OUT",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.openSans(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),

                                    SizedBox(width: 20,),

                                    Text("$outtime",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.openSans(
                                        fontSize: 15,
                                        color: pressAttention1 ? Colors.black : Colors.white,
                                      ),
                                    ),

                                    Text(_currentAddressout,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.openSans(
                                        fontSize: 15,
                                        color: pressAttention1 ? Colors.black : Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),


              SizedBox(height: 20,),


              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 100,
                    child: Center(
                        child: Row(
                          children: [
                            FlatButton(
                              color: Color(0xfffafafa),
                              onPressed: () {
                                _showFromDatePicker();
                              },
                              child: Icon(Icons.calendar_today_sharp),
                            ),

                            SizedBox(width: 10,),

                            Text(_fromDate,
                              style: GoogleFonts.openSans(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )
                    ),
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    padding: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.purple,
                          width: 1),
                      borderRadius: BorderRadius.circular(5),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  Positioned(
                    left: 40,
                    top: 12,
                    child: Container(
                      padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                      color: Color(0xfffafafa),
                      child: Text(
                        'Form Date',
                        style: GoogleFonts.openSans(
                            fontSize: 15,
                            color: Color(0xff8CA6DB)
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              //to date view
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 100,
                    child: Center(
                        child: Row(
                          children: [
                            FlatButton(
                              color: Color(0xfffafafa),
                              onPressed: () {
                                _showToDatePicker();
                              },
                              child: Icon(Icons.calendar_today_sharp),
                            ),

                            SizedBox(width: 10,),

                            Text(_toDate,
                              style: GoogleFonts.openSans(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),

                          ],
                        )
                    ),
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    padding: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.purple,
                          width: 1),
                      borderRadius: BorderRadius.circular(5),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  Positioned(
                    left: 40,
                    top: 12,
                    child: Container(
                      padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                      color: Color(0xfffafafa),
                      child: Text(
                        'To Date',
                        style: GoogleFonts.openSans(
                            fontSize: 15,
                            color: Color(0xff8CA6DB)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              //FlatButton or TextButton Container
              Center(
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width/1.2,
                  decoration: BoxDecoration(
                    color: Color(0xff8CA6DB),
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
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),

                    onPressed: ()async {
                      //something will change
                      print("Tapped");

                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Attendance_report(fromDate: _fromDate,toDate: _toDate,xstaff: widget.xstaff,xposition: widget.xposition,xsid: widget.xsid,)));

                    },
                    child: Text("View report",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10,),



            ],
          ),
        ),
      ),
    );
  }
}