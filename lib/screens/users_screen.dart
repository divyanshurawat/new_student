import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sceelie/AllFunctions.dart';
import 'package:sceelie/Selected_Case/case_detail.dart';
import 'package:sceelie/Selected_Case/user_detail.dart';
import 'package:sceelie/case_management/item_user.dart';
import 'package:sceelie/case_management/item_cases.dart';
import 'package:sceelie/model_classes/case_manage_admin_model.dart';
import 'package:sceelie/widgets/constants.dart';
import 'package:sceelie/widgets/list_fetch.dart';
import '../../color_class.dart';
List<UserManageAdminModel> userManageAdminForDisplay = [];
class UserManageAdmin extends StatefulWidget {
  const UserManageAdmin({Key? key}) : super(key: key);

  @override
  _UserManageAdminState createState() => _UserManageAdminState();
}

class _UserManageAdminState extends State<UserManageAdmin> {
  bool? checkedValue = false;
  bool? checkedValue1 = false;
  String? selectAll =" No";
  String? chosenValue;
  String? chosenValue1;
  var selectedIndex;

  bool all = true;
  bool free = false;
  bool premium = false;
  TextEditingController _controller = TextEditingController();


  List deleteItemsList = [];

  @override
  void initState() {
    super.initState();
    userManageAdminForDisplay = userManageAdmin;
  }
  void ask(){
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            "DELETE",
            style: TextStyle(
                fontSize: 17,
                fontWeight:
                FontWeight.bold),
          ),
          content: Padding(
            padding:
            const EdgeInsets.only(
                top: 10.0),
            child: selectAll!.contains("Yes")?Text(
                "Are you sure you want to delete all items?",
                style: TextStyle(
                    fontWeight:
                    FontWeight.bold,
                    fontSize: 20)):Text(
                "Are you sure you want to delete ${deleteItemsList.length} items?",
                style: TextStyle(
                    fontWeight:
                    FontWeight.bold,
                    fontSize: 20)),
          ),
          actions: [
            CupertinoDialogAction(
              child: Text("Yes",
                  style: TextStyle(
                      color: Colors
                          .black)),
              onPressed: () {

                for (int i = 0; i < deleteItemsList.length; i++) {
                  userManageAdminForDisplay.remove(deleteItemsList[i]);
                  setState(() {

                    userManageAdminForDisplay = List.from(userManageAdminForDisplay);
                  });

                }
                deleteItemsList = [];
                if(selectAll!.contains('Yes')){
                  userManageAdminForDisplay.clear();
                  setState(() {
                    userManageAdminForDisplay = List.from(userManageAdminForDisplay);

                    selectAll="No";
                  });


                }

                Fluttertoast.showToast(
                    msg:
                    "Deleted");


                Navigator.pop(context);
              },
            ),
            CupertinoDialogAction(
              child: Text("No",
                  style: TextStyle(
                      color: Colors
                          .black)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );


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
          "Hi, Nikita!",
          style: GoogleFonts.rosario(
            textStyle: TextStyle(
              color: cColor().blue,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: med.height -
              (AppBar().preferredSize.height) -
              (MediaQuery.of(context).padding.top),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: <Widget>[
                Container(
                    height: med.height * 0.08,
                    child: Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: med.width * 0.20,
                            padding: EdgeInsets.symmetric(
                                horizontal: 23, vertical: 10),
                            decoration: BoxDecoration(
                                color: cColor().blue,
                                borderRadius: BorderRadius.circular(30)),
                            child: Container(
                              color: cColor().yellow,
                              child: Icon(
                                Icons.arrow_back,
                                color: cColor().blue,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 6,
                            child: Center(
                                child: Text(
                                  user_managemnet,
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        color: cColor().yellow,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ))),
                        SizedBox(
                          width: med.width * 0.018,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if(deleteItemsList.length>0||selectAll!.contains("Yes"))
                                ask();


                            });
                          },
                          child: Container(
                            width: med.width * 0.20,
                            padding: EdgeInsets.symmetric(
                                horizontal: 23, vertical: 10),
                            decoration: BoxDecoration(
                                color: cColor().blue,
                                borderRadius: BorderRadius.circular(30)),
                            child: Container(
                              color: cColor().yellow,
                              child: Icon(
                                Icons.ballot,
                                color: cColor().blue,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                Container(
                  height: med.height * 0.015,
                ),
                Container(
                  width: double.infinity,
                  height: med.height * 0.64,
                  decoration: BoxDecoration(
                    color: cColor().blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 46,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Row(
                                  children: [
                                    Checkbox(
                                      fillColor: MaterialStateProperty.all(
                                          cColor().yellow),
                                      focusColor: cColor().black,
                                      activeColor: cColor().yellow,
                                      checkColor: cColor().black,
                                      value: checkedValue,
                                      onChanged: (value) {
                                        setState(() {

                                          checkedValue = value;
                                          if(checkedValue!){

                                            setState(() {
                                              selectAll = "Yes";
                                            });


                                          }else{
                                            setState(() {
                                              selectAll = "No";
                                            });

                                          }
                                          checkedValue1 = value;
                                        });
                                      },
                                    ),




                                  ],
                                ),
                              ),

                              Expanded(
                                  flex: 6,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        user_title,
                                        style: TextStyle(
                                            color: cColor().yellow,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(Icons.arrow_drop_up,color: Colors.deepOrangeAccent,)
                                    ],
                                  )),
                            ]),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: userManageAdminForDisplay.length,
                            padding: EdgeInsets.symmetric(vertical: 6),
                            itemBuilder: (_, index) {
                              return InkWell(
                                  onTap: ()async {


                                    final List<UserManageAdminModel> caseAdmin  = await  Navigator.of(context).push(MaterialPageRoute(
                                        builder: (_) =>UserCase(
                                          email: userManageAdminForDisplay[index].email,
                                          username: userManageAdminForDisplay[
                                          index].username,
                                          index: index,
                                          isFree: free,

                                          userManageAdminModel: userManageAdminForDisplay,
                                          caseId: userManageAdminForDisplay[
                                          index]
                                              .email
                                              .toString(),
                                          caseTitle:
                                          userManageAdminForDisplay[
                                          index]
                                              .username,
                                          caseSubscription:
                                          userManageAdminForDisplay[
                                          index]
                                              .subscription, spentmoney: userManageAdminForDisplay[index].spentMoney, now: userManageAdminForDisplay[index].dateTime,
                                          
                                        )));
                                    if( caseAdmin!=null){
                                      setState(() {
                                        userManageAdminForDisplay = List.from(caseAdmin);
                                      });
                                    }



                                  },
                                  child: Stack(
                                    alignment: Alignment.centerRight,
                                    children: [
                                      UserItem(
                                        isSelectedAll: selectAll,
                                        index: index,
                                        isSelected: (bool value){
                                          setState(() {
                                            if (value) {
                                              deleteItemsList.add(userManageAdminForDisplay[index]);
                                            } else {
                                              deleteItemsList.remove(userManageAdminForDisplay[index]);
                                            }
                                          });
                                          print("$index : $value");

                                        }, key: Key(userManageAdminForDisplay[index].rank.toString()), item: userManageAdminForDisplay[index],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 18.0),
                                        child: IconButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return CupertinoAlertDialog(
                                                  title: Text(
                                                    "DELETE",
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                  content: Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 10.0),
                                                    child: Text(
                                                        "Are you sure you want to delete ${userManageAdmin[index].username}",
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: 20)),
                                                  ),
                                                  actions: [
                                                    CupertinoDialogAction(
                                                      child: Text("Yes",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black)),
                                                      onPressed: () {
                                                        Fluttertoast.showToast(
                                                            msg:
                                                            "${userManageAdminForDisplay[index].username} is Deleted");
                                                        setState(() {
                                                          AllFunctions
                                                              .removeSingleItem(
                                                              userManageAdminForDisplay,
                                                              index);
                                                        });

                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                    CupertinoDialogAction(
                                                      child: Text("No",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black)),
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );

                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: cColor().yellow,
                                          ),
                                        ),
                                      ),
                                    ],

                                  )
                              );
                            }),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.search,
                                  color: cColor().yellow,
                                  size: 30,
                                ),
                              ),
                            ),
                            Container(
                              height: med.height * 0.04,
                              width: med.width * 0.7,
                              margin: EdgeInsets.only(bottom: 10.0),
                              child: TextField(
                                  controller: _controller,
                                  autocorrect: true,
                                  onChanged: (text) {
                                    text = text.toLowerCase();
                                    setState(() {
                                      userManageAdminForDisplay =
                                          userManageAdmin.where((element) {
                                            var userManageAdminTitle =
                                            element.username.toLowerCase();
                                            return userManageAdminTitle
                                                .contains(text);
                                          }).toList();
                                    });
                                  },
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: cColor().yellow),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: cColor().yellow),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6),
                        height: med.height * 0.06,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MaterialButton(
                              onPressed: () {
                                setState(() {
                                  userManageAdminForDisplay = userManageAdmin;
                                  all = true;
                                  free = false;
                                  premium = false;
                                });
                              },
                              child: Text(
                                "All",
                                style: TextStyle(
                                    fontSize: 19,
                                    fontFamily: "Rosario",
                                    color: all ? Colors.white : Colors.black),
                              ),
                              color: all ? Colors.black : cColor().yellow,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                            MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    all = false;
                                    userManageAdminForDisplay =List.from(userManageAdminForDisplay);

                                    free = true;
                                    premium = false;
                                    userManageAdminForDisplay =
                                        userManageAdmin.where((element) {
                                          var userManageAdminTitle =
                                          element.subscription.toString();
                                          return userManageAdminTitle
                                              .contains("0");
                                        }).toList();
                                  });
                                },
                                child: Text(
                                  "Free",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontFamily: "Rosario",
                                      color:
                                      free ? Colors.white : cColor().black),
                                ),
                                color: free ? Colors.black : cColor().yellow,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            MaterialButton(
                                onPressed: () {
                                  setState(() {

                                    userManageAdminForDisplay =List.from(userManageAdminForDisplay);
                                    // isPremium=true;

                                    free = false;
                                    all = false;
                                    premium = true;
                                    userManageAdminForDisplay =
                                        userManageAdmin.where((element) {
                                          var userManageAdminTitle =
                                          element.subscription.toString();
                                          return userManageAdminTitle
                                              .contains("1");
                                        }).toList();
                                  });
                                },
                                child: Text(
                                  "Premium",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontFamily: "Rosario",
                                      color: premium
                                          ? Colors.white
                                          : Colors.black),
                                ),
                                color: premium ? Colors.black : cColor().yellow,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  late final Color backColors;
  late final String buttontext;
  late final VoidCallback function;
  BottomButton(
      {required this.backColors,
        required this.buttontext,
        required this.function});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: function,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: backColors,
          ),
          child: Center(
            child: Text(
              '${buttontext}',
              style: GoogleFonts.roboto(
                letterSpacing: 1,
                fontSize: 18,
                color: backColors == Colors.black
                    ? cColor().yellow
                    : cColor().darkBrown,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
