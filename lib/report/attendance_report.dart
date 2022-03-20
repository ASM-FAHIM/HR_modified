import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'model/attendence_report_model.dart';
import 'package:http/http.dart' as http;

class Attendance_report extends StatefulWidget {
  //const Attendance_report({Key? key}) : super(key: key);

  Attendance_report({required this.fromDate, required this.toDate, required this.xstaff, required this.xposition, required this.xsid});

  String fromDate;
  String toDate;
  String xstaff;
  String xposition;
  String xsid;


  @override
  _Attendance_reportState createState() => _Attendance_reportState();
}

class _Attendance_reportState extends State<Attendance_report> {

  Future<List<AttendenceReportModel>>? futurePost;



  Future<List<AttendenceReportModel>> fetchPost() async {
    print("execute");

    var response= await http.post(Uri.parse('http://172.20.20.69/api/attandence_report.php'),body:
    jsonEncode(<String, String>{

      "zid":"100060",
      "user":"System.osl",
      "fdate": widget.fromDate,
      "tdate":widget.toDate,
      "empcat":"",
      "staff": widget.xstaff,
      //"staff":"EID-01885",
      "adminid": widget.xposition,
      // "adminid":"1881"

      // "zid": "100060",
      // "user": "System.osl",
      // "fdate": "2022-01-01",
      // "tdate":"2022-01-08",
      // "empcat":"" ,
      // "staff":"EID-02243",
      // "adminid": "793"

    })
    );
    print(response.statusCode);
    print(response.body);



    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<AttendenceReportModel>((json) => AttendenceReportModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futurePost = fetchPost();

    //fetchPost().whenComplete(() => futurePost);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF8CA6DB),
          title: Center(
              child: Text("Attendance Report",
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  fontSize: 20,
                ),
              )
          ),
        ),

        body:  Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder<List<AttendenceReportModel>>(
            future: futurePost,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text((DateFormat("dd-MM-yyyy").format(DateTime.parse((snapshot.data![index].xdate.date).toString()))).toString(),
                        //Text('${snapshot.data![index].xdate.date}',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        Text((DateFormat("hh:mm:ss").format(DateTime.parse((snapshot.data![index].xintime.date).toString()))).toString(),
                          //Text("${snapshot.data![index].xintime.date}",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        Text((DateFormat("hh:mm:ss").format(DateTime.parse((snapshot.data![index].xouttime.date).toString()))).toString(),
                          //Text("${snapshot.data![index].xouttime.date}",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                            fontSize: 15,
                            color: Colors.black,
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

      ),
    );
  }
}
