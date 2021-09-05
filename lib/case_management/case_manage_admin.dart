import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sceelie/AllFunctions.dart';
import 'package:sceelie/Selected_Case/Selected_Case.dart';
import 'package:sceelie/case_management/list_item.dart';
import 'package:sceelie/model_classes/case_manage_admin_model.dart';
import '../../../color_class.dart';

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
  List<CaseManageAdminModel> _caseManageAdmin = [
    CaseManageAdminModel(
        title: "Neoplasm",
        head: "Oncology",
        num: "032",
        subscription: 1,
        rank: 1),
    CaseManageAdminModel(
        title: "Lung Cancer",
        head: "Oncology",
        num: "452",
        subscription: 0,
        rank: 2),
    CaseManageAdminModel(
        title: "Measles",
        head: "Communication Dis ",
        num: "365",
        subscription: 1,
        rank: 3),
    CaseManageAdminModel(
        title: "Clavicular fx",
        head: "Oncology",
        num: "425",
        subscription: 0,
        rank: 4),
    CaseManageAdminModel(
        title: "Coma",
        head: "Traumatology",
        num: "456",
        subscription: 1,
        rank: 5),
    CaseManageAdminModel(
        title: "Jaundice",
        head: "Hepatologu",
        num: "100",
        subscription: 0,
        rank: 6),
    CaseManageAdminModel(
        title: "Neoplasm",
        head: "Oncology",
        num: "233",
        subscription: 1,
        rank: 7),
  ];
  List<CaseManageAdminModel> _caseManageAdminForDisplay = [];
  List deleteItemsList = [];

  @override
  void initState() {
    super.initState();
    _caseManageAdminForDisplay = _caseManageAdmin;
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
                              for (int i = 0; i < deleteItemsList.length; i++) {
                                _caseManageAdminForDisplay.remove(deleteItemsList[i]);
                              }
                              deleteItemsList = [];
                              if(selectAll!.contains('Yes')){
                                _caseManageAdminForDisplay.clear();
                                selectAll="No";
                              }
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
                                            _caseManageAdminForDisplay
                                              ..sort(
                                                    (a, b) {
                                                  return a.num.toString()
                                                      .compareTo(b.num);
                                                },
                                              );
                                            setState(() {});
                                          }
                                          if (chosenValue1 == "Desc") {
                                            _caseManageAdminForDisplay
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
                                              _caseManageAdminForDisplay
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
                                              _caseManageAdminForDisplay
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
                            itemCount: _caseManageAdminForDisplay.length,
                            padding: EdgeInsets.symmetric(vertical: 6),
                            itemBuilder: (_, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => SelectedCase(
                                            caseId: _caseManageAdminForDisplay[
                                                    index]
                                                .num
                                                .toString(),
                                            caseTitle:
                                                _caseManageAdminForDisplay[
                                                        index]
                                                    .title,
                                            caseSubscription:
                                                _caseManageAdminForDisplay[
                                                        index]
                                                    .subscription,
                                          )));
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
                                            deleteItemsList.add(_caseManageAdminForDisplay[index]);
                                          } else {
                                            deleteItemsList.remove(_caseManageAdminForDisplay[index]);
                                          }
                                        });
                                        print("$index : $value");

                                      }, key: Key(_caseManageAdminForDisplay[index].rank.toString()), item: _caseManageAdminForDisplay[index],
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
                                                      "Are you sure you want to delete ${_caseManageAdmin[index].title}",
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
                                                          "${_caseManageAdminForDisplay[index].title} is Deleted");
                                                      setState(() {
                                                        AllFunctions
                                                            .removeSingleItem(
                                                            _caseManageAdminForDisplay,
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
                                          // AwesomeDialog(
                                          //   btnOkText: 'Yes',
                                          //   btnCancelText: "No",
                                          //   dialogBackgroundColor:
                                          //       cColor().black,
                                          //   btnOkColor: cColor().yellow,
                                          //   context: context,
                                          //   dialogType:
                                          //       DialogType.INFO_REVERSED,
                                          //   borderSide: BorderSide(
                                          //       color: cColor().yellow,
                                          //       width: 2),
                                          //   buttonsBorderRadius:
                                          //       BorderRadius.all(
                                          //           Radius.circular(2)),
                                          //   headerAnimationLoop: false,
                                          //   animType: AnimType.BOTTOMSLIDE,
                                          //   title: 'DELETE',
                                          //   desc:
                                          //       'Are you Sure want to Delete ${_caseManageAdmin[index].title}',
                                          //   showCloseIcon: true,
                                          //   btnCancelOnPress: () {},
                                          //   btnOkOnPress: () {
                                          //     setState(() {
                                          //       _caseManageAdminForDisplay
                                          //           .removeAt(index);
                                          //     });

                                          //     Fluttertoast.showToast(
                                          //         msg:
                                          //             "${_caseManageAdminForDisplay[index].title} is Deleted",
                                          //         toastLength:
                                          //             Toast.LENGTH_SHORT,
                                          //         gravity:
                                          //             ToastGravity.CENTER,
                                          //         timeInSecForIosWeb: 1,
                                          //         backgroundColor:
                                          //             cColor().black,
                                          //         textColor: cColor().yellow,
                                          //         fontSize: 16.0);
                                          //   },
                                          // )..show();
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
                                      _caseManageAdminForDisplay =
                                          _caseManageAdmin.where((element) {
                                        var _caseManageAdminTitle =
                                            element.title.toLowerCase();
                                        return _caseManageAdminTitle
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
                                  _caseManageAdminForDisplay = _caseManageAdmin;
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
                                    free = true;
                                    premium = false;
                                    _caseManageAdminForDisplay =
                                        _caseManageAdmin.where((element) {
                                      var _caseManageAdminTitle =
                                          element.subscription.toString();
                                      return _caseManageAdminTitle
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
                                    free = false;
                                    all = false;
                                    premium = true;
                                    _caseManageAdminForDisplay =
                                        _caseManageAdmin.where((element) {
                                      var _caseManageAdminTitle =
                                          element.subscription.toString();
                                      return _caseManageAdminTitle
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
