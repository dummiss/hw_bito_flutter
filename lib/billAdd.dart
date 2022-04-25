import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'biiList.dart';

class BillAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BillAddState();
}

class BillAddState extends State<BillAdd> {
  TextEditingController _totalPriceController =
      TextEditingController(); //紀錄金額控制器

  var _money = 0;
  var _peopleNum;
  var _average;
  void _countaverang() {
    setState(() {
      _peopleNum = textFieldList.length;
      _average = _money / _peopleNum;
    });
  }
  // TextEditingController _pwdController = new TextEditingController();
  // GlobalKey _formKey = new GlobalKey<FormState>();

  Widget creatpaymoney() {
    var paymoney = _payvalue == '各自'
        ? TextField(
            decoration: InputDecoration(prefixIcon: Icon(Icons.attach_money)))
        : TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.attach_money),
                enabled: false,
                hintText: '$_average'));
    return (paymoney);
  }

  DropdownButton creatDropdown() {
    //付款方式選單
    return DropdownButton(
        value: _payvalue,
        items: const <DropdownMenuItem<String>>[
          DropdownMenuItem(child: Text("平分"), value: '平分'),
          DropdownMenuItem(child: Text("各自"), value: '各自'),
        ],
        hint: const Text("請選擇"), // 當沒有初始值時顯示
        onChanged: (value) {
          setState(() {
            _payvalue = value;
          });
        });
  }

  TextField creatNewTextField() {
    //新增分帳人用的TextField
    return TextField(
      decoration: InputDecoration(
          suffixIcon: IconButton(
        iconSize: 20,
        icon: Icon(Icons.person_remove),
        onPressed: () {
          setState(() {
            removeTextField();
          });
        },
      )),
    );
  }

//初始:分帳人用的
  List<TextField> textFieldList = [];
  List<Widget> paymoneyList = [];
//add:分帳人用的
  void addTextField() {
    textFieldList.add(creatNewTextField());
    paymoneyList.add(creatpaymoney());
    _countaverang();
  }

//remove:分帳人用的
  void removeTextField() {
    textFieldList.removeLast();
    paymoneyList.removeLast();
    _countaverang();
    // if(index == 0 ) {
    //   print(index);
    //   return ;
    // }else{
    //   textFieldList.removeAt(index);
    //   paymoneyList.removeAt(index);
    //   print(index);
    // }
  }

  //狀態改變用:分帳人用的
  List<Widget> _textFieldList() {
    return textFieldList;
  }

  var _value; //紀錄值:下拉選單用
  var _payvalue; //記錄值:付款方式用

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 24.0), //上下，左右
        child: Form(
          // key: _formKey, //設定globalKey，用於後面獲取FormState
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(bottom: 40),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 57, 86, 89),
                    ),
                    icon: Icon(
                      Icons.send,
                    ),
                    label: Text(
                      "送出",
                    ),
                    onPressed: () {},
                  )),
              ListTile(
                leading: Text(
                  '金額: ',
                  style: TextStyle(fontSize: 18),
                ),
                title: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 57, 86, 89),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 57, 86, 89),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (text) {
                      setState(() {
                        _money = int.parse(text);
                        _countaverang();
                        print(_money);
                      });
                    },
                    controller: _totalPriceController),
              ),
              Row(
                children: <Widget>[
                  (const Padding(
                      padding: EdgeInsets.only(left: 15, right: 19),
                      child: Text('分類:', style: TextStyle(fontSize: 18)))),
                  DropdownButton(
                    value: _value,
                    items: const <DropdownMenuItem<String>>[
                      DropdownMenuItem(child: Text("食物"), value: '食物'),
                      DropdownMenuItem(child: Text("飲料"), value: '飲料'),
                      DropdownMenuItem(child: Text("交通"), value: '交通'),
                      DropdownMenuItem(child: Text("住宿"), value: '住宿'),
                      DropdownMenuItem(child: Text("購物"), value: '購物'),
                      DropdownMenuItem(child: Text("其他"), value: '其他'),
                    ],
                    hint: const Text("請選擇"), // 當沒有初始值時顯示
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  ),
                ],
              ),
              const ListTile(
                leading: Text('名稱: ', style: TextStyle(fontSize: 18)),
                title: TextField(),
              ),
              const ListTile(
                leading: Text('備註: ', style: TextStyle(fontSize: 18)),
                title: TextField(),
              ),
              const ListTile(
                leading: Text('付款人: ', style: TextStyle(fontSize: 18)),
                title: TextField(),
              ),
              Row(children: [
                Padding(
                  padding: EdgeInsets.only(left: 17, right: 15),
                  child: Text('分帳人:', style: TextStyle(fontSize: 18)),
                ),
                Expanded(
                  //自適應框，不然會跑
                  child: Row(
                    children: [
                      Expanded(
                          //自適應框包雙層，不然會跑
                          child: TextField(
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                        iconSize: 20,
                        icon: Icon(Icons.person_add),
                        onPressed: () {
                          setState(() {
                            addTextField();
                          });
                        },
                      )))),
                      creatDropdown(),
                    ],
                  ),
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                        Container(
                            height: 500,
                            width: 150,
                            child: Column(children: textFieldList)),
                        Container(
                            height: 500,
                            width: 150,
                            child: Column(children: [
                              (_payvalue == "平分"
                                  ? Expanded(
                                      child: ListView.builder(
                                          itemCount: paymoneyList.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return TextField(
                                                decoration: InputDecoration(
                                                    prefixIcon: Icon(
                                                        Icons.attach_money),
                                                    enabled: false,
                                                    hintText: '$_average'));
                                          }))
                                  : Expanded(
                                      child: ListView.builder(
                                          itemCount: paymoneyList.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return TextField(
                                                decoration: InputDecoration(
                                                    prefixIcon: Icon(
                                                        Icons.attach_money)));
                                          }))),
                            ])),
                      ]))
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
