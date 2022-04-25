import 'package:flutter/material.dart';

import 'homePage.dart'; //起始頁面
import 'biiList.dart';
import 'basicBottomNavBar.dart'; //選單及各頁面串接 BillList()

void main() => runApp(MyApp());

//所有路口串接區
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: '/',
      routes: {
        '/': (context) {
          return HomePage();
        },
        '/listPage': (context) {
          return ListPage(data: ''); //先給定空值，不然會出錯 ???
        },
        '/billList':(context){
          return BillList( billData:'');
        }

      },
    );
  }
}
