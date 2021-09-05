import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Authentication/login_page.dart';
import 'color_class.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // fontFamily: "Rosario"
      ),
      home: const Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Login())));
  }

  @override
  Widget build(BuildContext context) {
    Size med = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: cColor().black,
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: med.height * 0.18,
            ),

            //logo image
            Center(
              child: Container(
                height: med.height * 0.2,
                width: med.width * 0.75,
                decoration: BoxDecoration(
                  color: cColor().black,
                  image: DecorationImage(
                    image: AssetImage("assets/logo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: med.height * 0.1,
            ),

            Center(
              child: Container(
                child: Text(
                  "OSCE Case Database",
                  style: GoogleFonts.rosario(
                    textStyle: TextStyle(
                      color: cColor().lightPink,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            Center(
              child: Container(
                child: Text(
                  "Peer Practice",
                  style: GoogleFonts.rosario(
                    textStyle: TextStyle(
                      color: cColor().lightPink,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 100),
            Container(
              
              width: MediaQuery.of(context).size.width*0.8,
              decoration: BoxDecoration(
               
                borderRadius: BorderRadius.circular(30)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: LinearProgressIndicator(
                 
                  backgroundColor: Colors.white,
                  color: Colors.blue,
                  minHeight: 30,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Loading...",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
