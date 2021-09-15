
class CaseManageAdminModel {
  late String num, head, title;
  late int subscription,rank;

  CaseManageAdminModel({required this.num, required this.title, required this.head ,required this.subscription,required this.rank});
}
class UserManageAdminModel {
  late String username, spentMoney, email;
  late DateTime? dateTime;
  late int subscription,rank;

  UserManageAdminModel({required this.username, required this.email, required this.spentMoney ,required this.subscription,required this.rank, this.dateTime});
}