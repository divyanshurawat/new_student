import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sceelie/screens/case_screen.dart';
import 'package:sceelie/model_classes/case_manage_admin_model.dart';
import 'package:sceelie/widgets/list_fetch.dart';

import '../AllFunctions.dart';
import '../color_class.dart';

class UserCase extends StatefulWidget {
  final String caseId,email,spentmoney;
  final DateTime? now;
  final String caseTitle, username;

  final bool isFree;
  final List<UserManageAdminModel> userManageAdminModel;
  final int caseSubscription;
  final int index;

  const UserCase(
      {required this.username,
      required this.isFree,
      required this.index,
      required this.caseId,
      required this.caseTitle,
      required this.caseSubscription,
      required this.userManageAdminModel, required this.email, required this.spentmoney, required this.now});

  @override
  _UserCaseState createState() => _UserCaseState();
}

class _UserCaseState extends State<UserCase> {
  bool isPremium = false;
  List<Widget> tablist = [
    Container(
      height: 60,
      width: 50,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22), topRight: Radius.circular(22))),
      child: Text(
        'sd',
        style: TextStyle(color: Colors.white),
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22), topRight: Radius.circular(22)),
      child: Tab(
        text: 'My Posts',
      ),
    ),
    Tab(
      text: 'Market',
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkSubscription();
  }

  checkSubscription() {
    if (widget.caseSubscription == 1) {
      setState(() {
        isPremium = true;
      });
    } else {
      setState(() {
        isPremium = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size med = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: cColor().black,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        centerTitle: true,
        title: Text(
          "User - ${widget.caseTitle}",
          style: GoogleFonts.rosario(
            textStyle: TextStyle(
              color: cColor().blue,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            SizedBox(
              height: med.height * 0.02,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CarouselWithIndicatorDemo(
                  username: widget.username, email: widget.email, isPremium: isPremium, now: widget.now, spentmoney: widget.spentmoney,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> tabviewlist = [
    Container(
      height: 100,
      color: Colors.amber,
    ),
    Container(
      height: 100,
      color: Colors.amber,
    ),
  ];
}

class CarouselWithIndicatorDemo extends StatefulWidget {
  final String username,email,spentmoney;
  final DateTime? now;
  final bool isPremium;
  CarouselWithIndicatorDemo({required this.username, required this.email, required this.spentmoney, required this.now, required this.isPremium});
  @override
  State<StatefulWidget> createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;

  List<Widget> imageSliders = [];

  @override
  void initState() {
    imageSliders = imageSlider.toList();
    super.initState();

  }

  final CarouselController _controller = CarouselController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cColor().black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          overflow: Overflow.clip,
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Positioned(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageSliders.asMap().entries.map((entry) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        alignment: Alignment.topCenter,
                        height: 90.0,

                        //  margin: EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            //   shape: BoxShape.circle,
                            color: _current == entry.key
                                ? cColor().blue
                                : cColor().TabUnselectedBlue),
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: entry.key == 0
                                ? Text(
                                    "User Detail",
                                    style: TextStyle(color: Colors.white),
                                  )
                                : Text(
                                    "Premium User",
                                    style: TextStyle(color: Colors.white),
                                  )),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Positioned(
              top: 30,
              child: Container(
                // width: 200,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  //   shape: BoxShape.circle,
                  color: cColor().blue,
                ),
                width: MediaQuery.of(context).size.width * 0.93,
                child: CarouselSlider.builder(
                  itemCount: imageSliders.length,
                  carouselController: _controller,
                  options: CarouselOptions(
                      viewportFraction: 1,
                      autoPlay: false,
                      enlargeCenterPage: false,
                      //  aspectRatio: 3.1,
                      height: MediaQuery.of(context).size.height * 0.78,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }), itemBuilder: (BuildContext context, int index, int realIndex) {
                    if(index ==0)
                    return   Container(
                      width: 700,
                      // padding: EdgeInsets.symmetric(horizontal: 60),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        //   shape: BoxShape.circle,
                        color: Colors.white,
                      ),

                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "User Details",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(height: 20,),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Username: ${widget.username}",
                                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                                  ),
                                  SizedBox(height: 13,),
                                  Text(
                                    "Email: ${widget.email}",
                                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                                  ),
                                  SizedBox(height: 13,),

                                  widget.isPremium?Text(
                                    "Status: Activated, Premium",
                                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                                  ):Text(
                                    "Status: Activated, Standard",
                                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                                  ),
                                  SizedBox(height: 13,),

                                ],
                              ),




                            ],
                          ),
                        ),
                      ),
                    );
                    else{
                      return Container(
                        width: 700,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          //   shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Payment Information",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                ),

                                SizedBox(height: 20,),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Username: ${widget.username}",
                                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                                    ),
                                    SizedBox(height: 13,),
                                    Text(
                                      "Email: ${widget.email}",
                                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                                    ),
                                    SizedBox(height: 13,),

                                    widget.isPremium?Text(
                                      "Status: Activated, Premium",
                                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                                    ):Text(
                                      "Status: Activated, Standard",
                                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                                    ),
                                    SizedBox(height: 13,),

                                  ],
                                ),
                                widget.isPremium?Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "As a premium user: ${widget.now.toString().substring(0,11)}",
                                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                                    ),
                                    SizedBox(height: 20,),
                                    Text(
                                      "Spent Money: ${widget.spentmoney}",
                                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                                    ),
                                  ],
                                ):Text(
                                  "This user is not a Premium User",
                                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                                ),



                              ],
                            ),
                          ),
                        ),
                      );
                    }
                },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
