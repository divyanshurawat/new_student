import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sceelie/AllFunctions.dart';
import 'package:sceelie/Selected_Case/case_detail.dart';
import 'package:sceelie/case_management/item_cases.dart';
import 'package:sceelie/model_classes/case_manage_admin_model.dart';
import 'package:sceelie/widgets/list_fetch.dart';
import '../../../color_class.dart';
List<CaseManageAdminModel> caseManageAdminForDisplay = [];
class CaseManageAdmin extends StatefulWidget {
  const CaseManageAdmin({Key? key}) : super(key: key);

  @override
  _CaseManageAdminState createState() => _CaseManageAdminState();
}

class _CaseManageAdminState extends State<CaseManageAdmin> {
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
    caseManageAdminForDisplay = caseManageAdmin;
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
                  caseManageAdminForDisplay.remove(deleteItemsList[i]);
                  setState(() {

                    caseManageAdminForDisplay = List.from(caseManageAdminForDisplay);
                  });

                }
                deleteItemsList = [];
                if(selectAll!.contains('Yes')){
                  caseManageAdminForDisplay.clear();
                  setState(() {
                    caseManageAdminForDisplay = List.from(caseManageAdminForDisplay);

                    selectAll="No";
                  });

                }

                Fluttertoast.showToast(
                    msg:
                    "is Deleted");


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
                              'Cases',
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
                                    new DropdownButton<String>(



                                      style: TextStyle(color: Colors.black),
                                      hint: Text(
                                        "No",
                                        style: TextStyle(
                                            color: cColor().yellow,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      items: <String>[
                                        'Asc',
                                        'Desc',
                                      ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(


                                              value: value,
                                              child: Text(value,style: TextStyle(fontSize: 10),),
                                            );
                                          }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          chosenValue1 = value!;
                                          print(chosenValue1);
                                          if (chosenValue1 == "Asc") {
                                            caseManageAdminForDisplay
                                              ..sort(
                                                    (a, b) {
                                                  return a.num.toString()
                                                      .compareTo(b.num);
                                                },
                                              );
                                            setState(() {});
                                          }
                                          if (chosenValue1 == "Desc") {
                                            caseManageAdminForDisplay
                                              ..sort(
                                                    (a, b) {
                                                  return b.num.toString()
                                                      .compareTo(a.num);
                                                },
                                              );
                                            setState(() {});
                                          }
                                        });
                                      },
                                    ),



                                  ],
                                ),
                              ),

                              Expanded(
                                  flex: 5,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      DropdownButton<String>(
                                        style: TextStyle(color: Colors.black),
                                        items: <String>[
                                          'A-Z',
                                          'Z-A',
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        hint: Text(
                                          "Title",
                                          style: TextStyle(
                                              color: cColor().yellow,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            chosenValue = value!;
                                            print(chosenValue);
                                            if (chosenValue == "A-Z") {
                                              caseManageAdminForDisplay
                                                ..sort(
                                                  (a, b) {
                                                    return a.title
                                                        .toString()
                                                        .toLowerCase()
                                                        .compareTo(b.title
                                                            .toString()
                                                            .toLowerCase());
                                                  },
                                                );
                                              setState(() {});
                                            }
                                            if (chosenValue == "Z-A") {
                                              caseManageAdminForDisplay
                                                ..sort(
                                                  (a, b) {
                                                    return b.title
                                                        .toString()
                                                        .toLowerCase()
                                                        .compareTo(a.title
                                                            .toString()
                                                            .toLowerCase());
                                                  },
                                                );
                                              setState(() {});
                                            }
                                          });
                                        },
                                      ),
                                    ],
                                  )),
                            ]),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: caseManageAdminForDisplay.length,
                            padding: EdgeInsets.symmetric(vertical: 6),
                            itemBuilder: (_, index) {
                              return InkWell(
                                onTap: ()async {


                             final List<CaseManageAdminModel> caseAdmin  = await  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => SelectedCase(
                                        index: index,
                                        isFree: free,

                                        caseManageAdminModel: caseManageAdminForDisplay,
                                            caseId: caseManageAdminForDisplay[
                                                    index]
                                                .num
                                                .toString(),
                                            caseTitle:
                                                caseManageAdminForDisplay[
                                                        index]
                                                    .title,
                                            caseSubscription:
                                                caseManageAdminForDisplay[
                                                        index]
                                                    .subscription,
                                          )));
                             if( caseAdmin!=null){
                               setState(() {
                                 caseManageAdminForDisplay = List.from(caseAdmin);
                               });
                             }



                                },
                                child: Stack(
                                  alignment: Alignment.centerRight,
                                  children: [
                                    ListItem(
                                      isSelectedAll: selectAll,
                                      index: index,
                                      isSelected: (bool value){
                                        setState(() {
                                          if (value) {
                                            deleteItemsList.add(caseManageAdminForDisplay[index]);
                                          } else {
                                            deleteItemsList.remove(caseManageAdminForDisplay[index]);
                                          }
                                        });
                                        print("$index : $value");

                                      }, key: Key(caseManageAdminForDisplay[index].rank.toString()), item: caseManageAdminForDisplay[index],
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
                                                      "Are you sure you want to delete ${caseManageAdmin[index].title}",
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
                                                          "${caseManageAdminForDisplay[index].title} is Deleted");
                                                      setState(() {
                                                        AllFunctions
                                                            .removeSingleItem(
                                                            caseManageAdminForDisplay,
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
                                      caseManageAdminForDisplay =
                                          caseManageAdmin.where((element) {
                                        var caseManageAdminTitle =
                                            element.title.toLowerCase();
                                        return caseManageAdminTitle
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
                                  caseManageAdminForDisplay = caseManageAdmin;
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
                                    caseManageAdminForDisplay =List.from(caseManageAdminForDisplay);

                                    free = true;
                                    premium = false;
                                    caseManageAdminForDisplay =
                                        caseManageAdmin.where((element) {
                                      var caseManageAdminTitle =
                                          element.subscription.toString();
                                      return caseManageAdminTitle
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

                                      caseManageAdminForDisplay =List.from(caseManageAdminForDisplay);
                                      // isPremium=true;

                                    free = false;
                                    all = false;
                                    premium = true;
                                    caseManageAdminForDisplay =
                                        caseManageAdmin.where((element) {
                                      var caseManageAdminTitle =
                                          element.subscription.toString();
                                      return caseManageAdminTitle
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
