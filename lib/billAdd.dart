import 'package:flutter/material.dart';

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

  // void _countaverang(){
  //   setState(() {
  //     _peopleNum=textFieldList.length;
  //     _average=_money/_peopleNum;
  //   });
  // }
  // TextEditingController _pwdController = new TextEditingController();
  // GlobalKey _formKey = new GlobalKey<FormState>();

  Widget creatpaymoney() {
    var paymoney = _payvalue == '各自'
        ?  TextField(
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
    _peopleNum = textFieldList.length;
    _average = _money / _peopleNum;
  }

//remove:分帳人用的
  void removeTextField() {
      textFieldList.removeLast();
      paymoneyList.removeLast();
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
  List<TextField> _textFieldList() {
    return textFieldList;
  }

  List<Widget> _paymoneyList() {
    return paymoneyList;
  }

  var _value; //紀錄值:下拉選單用
  var _payvalue; //記錄值:付款方式用

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0), //上下，左右
        child: Form(
          // key: _formKey, //設定globalKey，用於後面獲取FormState
          child: Column(
            children: [
              ListTile(
                leading: Text('金額: '),
                title: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (text) {
                      setState(() {
                        _money = int.parse(text);
                        print(_money);
                      });
                    },
                    controller: _totalPriceController),
              ),
              Row(
                children: <Widget>[
                  (const Padding(
                      padding: EdgeInsets.only(left: 15, right: 19),
                      child: Text(
                        '分類:',
                      ))),
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
                leading: Text('名稱: '),
                title: TextField(),
              ),
              const ListTile(
                leading: Text('備註: '),
                title: TextField(),
              ),
              const ListTile(
                leading: Text('付款人: '),
                title: TextField(),
              ),
              Row(children: [
                Padding(
                  padding: EdgeInsets.only(left: 17, right: 15),
                  child: Text('分帳人:'),
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
                            width: 150,
                            child: Column(children: _textFieldList())),
                        Container(
                            width: 150,
                            child: Column(children: _paymoneyList())),
                      ]))
                ],
              )
              // Padding(
              //   padding: EdgeInsets.only(left: 80),
              //   child: Column(children: _textFieldList()),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(left: 80),
              //   child: Column(children: _paymoneyList()),
              // ),
            ],
          ),
        ),
      )),
    );
  }
}
