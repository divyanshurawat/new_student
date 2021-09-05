import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sceelie/AllFunctions.dart';
import 'package:sceelie/case_management/case_manage_admin.dart';
import 'package:sceelie/model_classes/case_manage_admin_model.dart';

import '../color_class.dart';

class ListItem extends StatefulWidget {
  final Key key;
  final CaseManageAdminModel item;
  final int index;
  final ValueChanged<bool> isSelected;

  final String? isSelectedAll;

  const ListItem(
      {required this.isSelectedAll,
      required this.index,
      required this.key,
      required this.item,
      required this.isSelected})
      : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
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
                    Text(widget.item.num,
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                          color: cColor().yellow,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ))),
                    SizedBox(
                      width: 4,
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
                          )
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
            flex: 6,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.local_offer_rounded,
                        color: cColor().yellow,
                        size: 14,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          widget.item.head,
                          style: TextStyle(
                              color: cColor().yellow,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    widget.item.title,
                    style: TextStyle(
                        color: cColor().yellow,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )
                ],
              ),
            )),
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
