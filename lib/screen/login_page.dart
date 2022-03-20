// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hrandsells/drawer/drawer_page.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';
//
// class Login_page extends StatefulWidget {
//   const Login_page({Key? key}) : super(key: key);
//
//   @override
//   _Login_pageState createState() => _Login_pageState();
// }
//
// class _Login_pageState extends State<Login_page> {
//
//   GlobalKey<FormState> _formkey = GlobalKey<FormState>();
//
//   late String username;
//   late String password;
//
//
//
//   bool _obsecureText = true;
//
//   void toggle(){
//     setState(() {
//       _obsecureText = !_obsecureText;
//     });
//   }
//
//
//   Future<void>signin()async{
//     final FormState? formState = _formkey.currentState;
//
//     if(formState!.validate()) {
//       formState.save();
//       if(username == '1234' && password == '1234'){
//         Navigator.push(context, MaterialPageRoute(builder: (context) => Drawerpage()));
//       }
//       else{
//         // print("user not found");
//       }
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Color(0xFFF15922),
//             title: Center(
//               child: Text("Account",
//                 style: GoogleFonts.openSans(
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//           ),
//
//           body: Center(
//             child: SingleChildScrollView(
//               child: Form(
//                 key: _formkey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//
//                     Container(
//                       height: 200,
//                       width: 200,
//                       child: ClipRRect(
//
//                         borderRadius: BorderRadius.circular(20),
//                         child: Image(
//                           image: AssetImage(
//                               'images/osl2.jpg'),
//                         ),
//                       ),
//                     ),
//
//                     Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Container(
//                        // decoration: BoxDecoration(
//                        //   color: Colors.white,
//                        //   border: Border.all(color: Colors.grey),
//                        // ),
//                        child: TextFormField(
//                          onChanged: (input){
//                            username = input;
//                          },
//                          validator: (input){
//                            if(input!.isEmpty){
//                              return "Empty";
//                            }
//                          },
//
//                          scrollPadding: EdgeInsets.all(20),
//                          decoration: const InputDecoration(
//                            contentPadding: EdgeInsets.only(left: 20), // add padding to adjust text
//                            isDense: false,
//                            hintText: "User Name",
//                            labelText: "User Name",
//                            border: OutlineInputBorder(),
//                            suffixIcon: Padding(
//                              padding: EdgeInsets.only(top: 8), // add padding to adjust icon
//                              child: Icon(Icons.person),
//                            ),
//                          ),
//                        ),
//                       ),
//                     ),
//
//
//                     Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Container(
//                         // decoration: BoxDecoration(
//                         //   color: Colors.white,
//                         //   border: Border.all(color: Colors.grey),
//                         // ),
//                         child: TextFormField(
//                           obscureText: _obsecureText,
//                           onChanged: (input){
//                             password = input;
//                           },
//                           scrollPadding: EdgeInsets.all(20),
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.only(left: 20), // add padding to adjust text
//                             isDense: true,
//                             hintText: "Password",
//                             labelText: "Password",
//                             border: OutlineInputBorder(),
//                             suffixIcon: Padding(
//                               padding: EdgeInsets.only(top: 8), // add padding to adjust icon
//                               child: IconButton(
//                                   icon: Icon(_obsecureText ? FontAwesomeIcons.solidEye : FontAwesomeIcons.solidEyeSlash,),
//                                   onPressed: (){
//                                     toggle();
//                                   },
//                               )
//
//
//                             ),
//
//                           ),
//                         ),
//                       ),
//                     ),
//
//
//                     Container(
//                       height: 40,
//                       width: MediaQuery.of(context).size.width/1.2,
//                       decoration: BoxDecoration(
//                         color: Color(0xffF15922),
//                         //border: Border.all(color: Colors.grey),
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 1,
//                             blurRadius: 5,
//                             offset: Offset(0, 3), // changes position of shadow
//                           ),
//                         ],
//                       ),
//                       child: FlatButton(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20.0)),
//
//                         onPressed: (){
//                           signin();
//                           //print(username);
//                         },
//                         child: Text("Login",
//                           textAlign: TextAlign.center,
//                           style: GoogleFonts.openSans(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ),
//             ),
//           ),
//
//         ),
//       ),
//     );
//   }
// }


//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hrandsells/data_model/loginModel.dart';
// import 'package:hrandsells/drawer/drawer_page.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
//
// Future<List<LoginModel>> fetchPost() async {
//   final response =
//   await http.get(Uri.parse('https://192.168.29.70/sellsapi/loginapi.php'));
//
//
//
//   if (response.statusCode == 200) {
//     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
//
//     return parsed.map<LoginModel>((json) => LoginModel.fromJson(json)).toList();
//   } else {
//     throw Exception('Failed to load album');
//   }
// }
//
// class Login_page extends StatefulWidget {
//   const Login_page({Key? key}) : super(key: key);
//
//   @override
//   _Login_pageState createState() => _Login_pageState();
// }
//
// class _Login_pageState extends State<Login_page> {
//
//   GlobalKey<FormState> _formkey = GlobalKey<FormState>();
//
//   late String zemail;
//   late String xpassword;
//
//   bool _obsecureText = true;
//
//   void toggle(){
//     setState(() {
//       _obsecureText = !_obsecureText;
//     });
//   }
//
//
//   // Future<void>signin()async{
//   //   final FormState? formState = _formkey.currentState;
//   //
//   //   if(formState!.validate()) {
//   //     formState.save();
//   //     if(username == '1234' && password == '1234'){
//   //       Navigator.push(context, MaterialPageRoute(builder: (context) => Drawerpage()));
//   //     }
//   //     else{
//   //       // print("user not found");
//   //     }
//   //   }
//   // }
//
//   submitData(String zemail, String xpassword) async{
//
//     print(zemail);
//     print(xpassword);
//
//     //print(status1);
//
//
//     var response= await http.post(Uri.parse('http://192.168.29.70/sellsapi/loginapi.php'),body:
//     jsonEncode(<String, String>{
//       "zemail": zemail,
//       "xpassword": xpassword,
//     })
//     );
//     //var data = response.body;
//     // print (data);
//
//     List<LoginModel> data = loginModelFromJson(response.body);
//
//     String data1 = response.body;
//
//     //print ("return user data\n"+response.body);
//     //print(response.body);
//     print(data1);
//
//     // if(response.statusCode==201){
//     //   String responseString= response.body;
//     //   leaveTourModelFromJson(responseString);
//     // }
//     // else return null;
//   }
//
//   Future<List<LoginModel>>? futurePost;
//
//   @override
//   void initState() {
//     super.initState();
//     futurePost = fetchPost();
//
//     fetchPost().whenComplete(() => futurePost);
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: Scaffold(
//           // appBar: AppBar(
//           //   backgroundColor: Color(0xFF8CA6DB),
//           //   title: Center(
//           //     child: Text("Account",
//           //       style: GoogleFonts.openSans(
//           //         fontSize: 20,
//           //       ),
//           //     ),
//           //   ),
//           // ),
//
//           body: Center(
//             child: SingleChildScrollView(
//               child: Form(
//                 key: _formkey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//
//                     Container(
//                       height: 200,
//                       width: 200,
//                       child: ClipRRect(
//
//                         borderRadius: BorderRadius.circular(20),
//                         child: Image(
//                           image: AssetImage(
//                               'images/orange.png'),
//                         ),
//                       ),
//                     ),
//
//                     Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Container(
//                         // decoration: BoxDecoration(
//                         //   color: Colors.white,
//                         //   border: Border.all(color: Colors.grey),
//                         // ),
//                         child: TextFormField(
//                           onChanged: (input){
//                             zemail = input;
//                           },
//                           validator: (input){
//                             if(input!.isEmpty){
//                               return "Empty";
//                             }
//                           },
//
//                           scrollPadding: EdgeInsets.all(20),
//                           decoration: const InputDecoration(
//                             contentPadding: EdgeInsets.only(left: 20), // add padding to adjust text
//                             isDense: false,
//                             hintText: "User Name",
//                             labelText: "User Name",
//                             border: OutlineInputBorder(),
//                             suffixIcon: Padding(
//                               padding: EdgeInsets.only(top: 8), // add padding to adjust icon
//                               child: Icon(Icons.person),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//
//
//                     Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Container(
//                         // decoration: BoxDecoration(
//                         //   color: Colors.white,
//                         //   border: Border.all(color: Colors.grey),
//                         // ),
//                         child: TextFormField(
//                           obscureText: _obsecureText,
//                           onChanged: (input){
//                             xpassword = input;
//                           },
//                           scrollPadding: EdgeInsets.all(20),
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.only(left: 20), // add padding to adjust text
//                             isDense: true,
//                             hintText: "Password",
//                             labelText: "Password",
//                             border: OutlineInputBorder(),
//                             suffixIcon: Padding(
//                                 padding: EdgeInsets.only(top: 8), // add padding to adjust icon
//                                 child: IconButton(
//                                   icon: Icon(_obsecureText ? FontAwesomeIcons.solidEye : FontAwesomeIcons.solidEyeSlash,),
//                                   onPressed: (){
//                                     toggle();
//                                   },
//                                 )
//
//
//                             ),
//
//                           ),
//                         ),
//                       ),
//                     ),
//
//
//                     Container(
//                       height: 40,
//                       width: MediaQuery.of(context).size.width/1.2,
//                       decoration: BoxDecoration(
//                         color: Color(0xFFF65528),
//                         //border: Border.all(color: Colors.grey),
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 1,
//                             blurRadius: 5,
//                             offset: Offset(0, 3), // changes position of shadow
//                           ),
//                         ],
//                       ),
//                       child: FlatButton(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20.0)),
//
//                         onPressed: (){
//                           submitData(zemail, xpassword);
//                           //signin();
//                           //print(username);
//                           // _getCurrentLocation();
//                           // print(_currentAddress);
//                           // //print(_currentPosition);
//                           // print(_currentPosition.latitude);
//                           // print(_currentPosition.longitude);
//                         },
//                         child: Text("Login",
//                           textAlign: TextAlign.center,
//                           style: GoogleFonts.openSans(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//
//
//                     Container(
//                       height: MediaQuery.of(context).size.height,
//                       width: MediaQuery.of(context).size.width,
//                       child: FutureBuilder<List<LoginModel>>(
//                         future: futurePost,
//                         builder: (context, snapshot) {
//                           if (snapshot.hasData) {
//                             return ListView.builder(
//                               itemCount: snapshot.data!.length,
//                               itemBuilder: (_, index) => Container(
//                                 child: Column(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(top: 20.0,right: 20,left: 20),
//                                       child: Container(
//                                         height: MediaQuery.of(context).size.width/2.5,
//                                         width: MediaQuery.of(context).size.width,
//                                         decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           //border: Border.all(color: Colors.grey),
//                                           borderRadius: BorderRadius.circular(20),
//                                           boxShadow: [
//                                             BoxShadow(
//                                               color: Colors.grey.withOpacity(0.5),
//                                               spreadRadius: 1,
//                                               blurRadius: 5,
//                                               offset: Offset(0, 3), // changes position of shadow
//                                             ),
//                                           ],
//                                         ),
//                                         child: Column(
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           mainAxisAlignment: MainAxisAlignment.start,
//                                           children: [
//                                             Padding(
//                                               padding: const EdgeInsets.only(left: 20.0,top: 15),
//                                               child: Container(
//                                                 padding: const EdgeInsets.all(10),
//                                                 decoration: BoxDecoration(
//                                                   //color: changeColor((snapshot.data![index].aprovalstatus).toString()),
//                                                   //border: Border.all(color: Colors.grey),
//                                                   borderRadius: BorderRadius.circular(10),
//                                                   boxShadow: [
//                                                     BoxShadow(
//                                                       color: Colors.grey.withOpacity(0.5),
//                                                       spreadRadius: 1,
//                                                       blurRadius: 5,
//                                                       offset: Offset(0, 3), // changes position of shadow
//                                                     ),
//                                                   ],
//                                                 ),
//
//                                                 child: Text("${snapshot.data![index].zemail}",
//                                                   textAlign: TextAlign.center,
//                                                   style: GoogleFonts.openSans(
//                                                     fontSize: 15,
//                                                     color: Colors.white,
//                                                   ),
//                                                 ),
//
//                                               ),
//                                             ),
//
//                                             Row(
//                                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                               children: [
//                                                 Padding(
//                                                   padding: const EdgeInsets.only(top: 10.0,left: 20),
//                                                   child: Column(
//                                                     //mainAxisAlignment: MainAxisAlignment.start,
//                                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                                     children: [
//                                                       Text("${snapshot.data![index].xname}",
//                                                         textAlign: TextAlign.left,
//                                                         style: GoogleFonts.openSans(
//                                                           fontSize: 20,
//                                                           color: Colors.grey,
//                                                         ),
//                                                       ),
//
//                                                       Text("Approved By",
//                                                         textAlign: TextAlign.left,
//                                                         style: GoogleFonts.openSans(
//                                                           fontSize: 15,
//                                                           color: Colors.grey,
//                                                         ),
//                                                       ),
//
//                                                       Text("Soyaib Sharafi",
//                                                         textAlign: TextAlign.left,
//                                                         style: GoogleFonts.openSans(
//                                                           fontSize: 15,
//                                                           color: Colors.grey,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//
//                                                 SizedBox(width: 60,),
//
//                                                 Column(
//                                                   children: [
//                                                     Text("${snapshot.data![index].xposition}" + " - ",
//                                                       textAlign: TextAlign.center,
//                                                       style: GoogleFonts.openSans(
//                                                         fontSize: 15,
//                                                         color: Colors.grey,
//                                                       ),
//                                                     ),
//
//                                                     Text("${snapshot.data![index].xrole}",
//                                                       textAlign: TextAlign.center,
//                                                       style: GoogleFonts.openSans(
//                                                         fontSize: 15,
//                                                         color: Colors.grey,
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//
//                                               ],
//                                             ),
//
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(height: 20,)
//                                   ],
//                                 ),
//
//                               ),
//                             );
//                           } else {
//                             return Center(
//                               child: Image(image: AssetImage("images/loading.gif")),
//                             );
//                           }
//                         },
//                       ),
//                     ),
//
//
//                   ],
//                 ),
//               ),
//             ),
//           ),
//
//         ),
//       ),
//     );
//   }
// }
//



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrandsells/data_model/loginModel.dart';
import 'package:hrandsells/drawer/drawer_page.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hrandsells/home_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:permission_handler/permission_handler.dart';


//
// Future<List<LoginModel>> fetchPost() async {
//   final response =
//   await http.get(Uri.parse('https://192.168.29.70/sellsapi/loginapi.php'));
//
//
//
//   if (response.statusCode == 200) {
//     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
//
//     return parsed.map<LoginModel>((json) => LoginModel.fromJson(json)).toList();
//   } else {
//     throw Exception('Failed to load album');
//   }
// }

class Login_page extends StatefulWidget {
  const Login_page({Key? key}) : super(key: key);

  @override
  _Login_pageState createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  late String zemail;
  late String xpassword;

  bool _obsecureText = true;

  void toggle(){
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }


  // Future<void>signin()async{
  //   final FormState? formState = _formkey.currentState;
  //
  //   if(formState!.validate()) {
  //     formState.save();
  //     if(username == '1234' && password == '1234'){
  //       Navigator.push(context, MaterialPageRoute(builder: (context) => Drawerpage()));
  //     }
  //     else{
  //       // print("user not found");
  //     }
  //   }
  // }

  late LoginModel data;





  submitData(String zemail, String xpassword) async{

    print(zemail);
    print(xpassword);

    //print(status1);


    var response= await http.post(Uri.parse('http://172.20.20.69/api/loginapi.php'),body:
    jsonEncode(<String, String>{
      "zemail": zemail,
      "xpassword": xpassword,
    })
    );
    //var data = response.body;
    // print (data);

    data = loginModelFromJson(response.body);

    //print ("return user data\n"+response.body);
    print(response.body);
    print(response.statusCode);
    print(data.zemail);

    if(response.statusCode == 200 && data.xpassword == xpassword){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage(loginModel: data,)));
    }
    else if(response.statusCode == 200 && data.xpassword != xpassword) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Password Wrong",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ));
    }

    else if(response.statusCode == 200 && data.zemail != zemail) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Credential Not Match",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ));
    }



    // if(response.statusCode==201){
    //   String responseString= response.body;
    //   leaveTourModelFromJson(responseString);
    // }
    // else return null;
  }

  Future<List<LoginModel>>? futurePost;

  @override
  void initState() {
    super.initState();
    // futurePost = fetchPost();
    //
    //
    // fetchPost().whenComplete(() => futurePost);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Color(0xFF8CA6DB),
          //   title: Center(
          //     child: Text("Account",
          //       style: GoogleFonts.openSans(
          //         fontSize: 20,
          //       ),
          //     ),
          //   ),
          // ),

          body: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                      height: 200,
                      width: 200,
                      child: ClipRRect(

                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          image: AssetImage(
                              'images/orange.png'),
                        ),
                      ),
                    ),

                    
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        // decoration: BoxDecoration(
                        //   color: Colors.white,
                        //   border: Border.all(color: Colors.grey),
                        // ),
                        child: TextFormField(
                          onChanged: (input){
                            zemail = input;
                          },
                          validator: (input){
                            if(input!.isEmpty){
                              return "Empty";
                            }
                          },

                          scrollPadding: EdgeInsets.all(20),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(left: 20), // add padding to adjust text
                            isDense: false,
                            hintText: "User Name",
                            labelText: "User Name",
                            border: OutlineInputBorder(),
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(top: 8), // add padding to adjust icon
                              child: Icon(Icons.person),
                            ),
                          ),
                        ),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        // decoration: BoxDecoration(
                        //   color: Colors.white,
                        //   border: Border.all(color: Colors.grey),
                        // ),
                        child: TextFormField(
                          obscureText: _obsecureText,
                          onChanged: (input){
                            xpassword = input;
                          },
                          scrollPadding: EdgeInsets.all(20),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 20), // add padding to adjust text
                            isDense: true,
                            hintText: "Password",
                            labelText: "Password",
                            border: OutlineInputBorder(),
                            suffixIcon: Padding(
                                padding: EdgeInsets.only(top: 8), // add padding to adjust icon
                                child: IconButton(
                                  icon: Icon(_obsecureText ? FontAwesomeIcons.solidEye : FontAwesomeIcons.solidEyeSlash,),
                                  onPressed: (){
                                    toggle();
                                  },
                                )


                            ),

                          ),
                        ),
                      ),
                    ),


                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width/1.2,
                      decoration: BoxDecoration(
                        color: Color(0xFFF65528),
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

                        onPressed: ()async{

                          submitData(zemail, xpassword);
                          //signin();
                          //print(username);
                          // _getCurrentLocation();
                          // print(_currentAddress);
                          // //print(_currentPosition);
                          // print(_currentPosition.latitude);
                          // print(_currentPosition.longitude);
                        },
                        child: Text("Login",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),





                  ],
                ),
              ),
            ),
          ),

        ),
      ),
    );
  }
}

