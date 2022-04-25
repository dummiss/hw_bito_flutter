import 'package:flutter/material.dart';


class BillList extends StatefulWidget {
  final String billData; //接從home傳來的資料
  BillList({Key? key, required this.billData}) : super(key: key);



  @override
  State<StatefulWidget> createState() => BillListState();
}

class BillListState extends State<BillList> {
  @override
  Widget build(BuildContext context) {
    return const Text('BillListState');
  }
}