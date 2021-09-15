import 'package:flutter/material.dart';
import 'package:sceelie/model_classes/case_manage_admin_model.dart';
DateTime now = DateTime.now();
List<Widget> imageSlider =[
  Text("First "),
  Text("Second")
];
List<CaseManageAdminModel> caseManageAdmin = [
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
List<UserManageAdminModel> userManageAdmin = [
  UserManageAdminModel(
      username: "Nikita Novikov",  dateTime: now, subscription: 1,rank: 1, spentMoney: '12314', email: 'NikitaNovikov@gmail.com'),
  UserManageAdminModel(
      username: "Jim Claire",  dateTime: now, subscription: 1,rank: 2, spentMoney: '24232',email: 'NikitaNovikov@gmail.com'),
  UserManageAdminModel(
      username: "Charles Briggs",

      dateTime: now,
      subscription: 1,
  rank: 3, email: 'NikitaNovikov@gmail.com', spentMoney: '24322'),
  UserManageAdminModel(
      username: "Tom Craig",  dateTime: now, subscription: 0,rank: 4, email: 'NikitaNovikov@gmail.com', spentMoney: '24r34'),
  UserManageAdminModel(
      username: "Canon Bream",  dateTime: now, subscription: 0,rank: 5, email: 'NikitaNovikov@gmail.com', spentMoney: '53211'),
  UserManageAdminModel(
      username: "Doctordream", dateTime: now, subscription: 0,rank: 6, email: 'NikitaNovikov@gmail.com', spentMoney: '431145'),
  UserManageAdminModel(
      username: "Goodintern",  dateTime: now, subscription: 1,rank: 7, email: 'NikitaNovikov@gmail.com', spentMoney: '34321'),
  UserManageAdminModel(
      username: "Eagerbeaver",  dateTime: now, subscription: 0,rank: 8, email: 'NikitaNovikov@gmail.com', spentMoney: '421445'),

];