import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sceelie/AllFunctions.dart';
import 'package:sceelie/screens/case_screen.dart';
import 'package:sceelie/model_classes/case_manage_admin_model.dart';

import '../color_class.dart';

class UserItem extends StatefulWidget {
  final Key key;
  final UserManageAdminModel item;
  final int index;
  final ValueChanged<bool> isSelected;

  final String? isSelectedAll;

  const UserItem(
      {required this.isSelectedAll,
        required this.index,
        required this.key,
        required this.item,
        required this.isSelected})
      : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<UserItem> {
  bool? checkedValue = false;
  bool? checkedValue1 = false;
  String? chosenValue;
  String? chosenValue1;

  bool isSelected = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size med = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      height: med.height * 0.07,
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Expanded(
          flex: 5,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return new Checkbox(
                      fillColor: MaterialStateProperty.all(cColor().yellow),
                      focusColor: cColor().black,
                      activeColor: cColor().yellow,
                      checkColor: cColor().black,
                      value: widget.isSelectedAll!.contains("No")
                          ? checkedValue1
                          : true,
                      onChanged: (value) {
                        setState(() {
                          isSelected = !isSelected;
                          widget.isSelected(isSelected);

                          checkedValue1 = isSelected;
                        });
                      },
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    SizedBox(
                      width: 2,
                    ),
                    widget.item.subscription == 1
                        ? SvgPicture.asset(
                      "assets/dollar.svg",
                      height: 16.67,
                      width: 16.67,
                    )
                        : Container(
                      height: 16.67,
                      width: 16.67,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          widget.item.username,
                          style: TextStyle(
                              color: cColor().yellow,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          width: med.width * 0.04,
        ),
      ]),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(29),
        color: Colors.white,
      ),
    );
  }
}
