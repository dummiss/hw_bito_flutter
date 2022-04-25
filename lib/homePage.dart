import 'package:flutter/material.dart';
import 'dart:math';
import 'basicBottomNavBar.dart'; //選單及各頁面串接

//登入創建頁面
class HomePage extends StatelessWidget {
  // const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(); //創建控制器取得INPUT值

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 57, 86, 89),
        body: Container(
            child: Center(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: const Text('Spend Together',
                  style: TextStyle(
                      color: Color.fromARGB(255, 186, 217, 217),
                      fontSize: 32,
                      fontWeight: FontWeight.w900)),
            ),
            Container(
              margin: const EdgeInsets.only(top: 70, bottom: 20),
              child: const Text('請先輸入您的姓名',
                  style: TextStyle(
                      color: Color.fromARGB(255, 186, 217, 217),
                      fontSize: 12,
                      fontWeight: FontWeight.w900)),
            ),
            Container(
                width: 250,
                child: TextField(
                  controller: controller, //取得文字
                  // onEditingComplete: () {   //針對鍵盤按送出抓取用
                  //   print('onEditingComplete');
                  // },
                  decoration: InputDecoration(
                      // icon: Icon(Icons.person_outline),
                      hintText: 'name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      fillColor: const Color.fromARGB(255, 242, 187, 119), //背景顏色
                      filled: true,
                      isDense: true, // 讓input框可以隨高度置中
                      contentPadding: const EdgeInsets.all(13), // 讓input框可以隨高度置中
                      suffix: IconButton(
                          //輸入框的取消鍵盤X
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          iconSize: 20,
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            FocusScope.of(context)
                                .requestFocus(FocusNode());
                          })),
                )),
            Container(
                margin: const EdgeInsets.only(top: 30),
                child: Transform.rotate(
                    angle: -pi / 2,
                    child: IconButton(
                      iconSize: 50,
                      color: const Color.fromARGB(255, 186, 217, 217),
                      // highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      icon: const Icon(Icons.arrow_circle_down),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ListPage(data: controller.text)));
                        print(controller.text);
                        print("click");
                      },
                    ))

                // Image.asset('lib/images/next-btn.png'),
                )
          ],
        ))));
  }
}
