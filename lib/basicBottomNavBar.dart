import 'package:flutter/material.dart';
import 'billAdd.dart';
import 'biiList.dart';
import 'billDebt.dart';
//帳單清單頁面
class ListPage extends StatefulWidget {
  final String data; //接從home傳來的資料
  ListPage({Key? key, required this.data}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ListPagesState();
}

class ListPagesState extends State<ListPage> {
  //底部導覽切換的頁面
  final _pages = <Widget>[
    BillList(),
    BillAdd(),
    BillDebt(),
  ];

  // 底部導航欄要顯示的所有子項
  final List<BottomNavigationBarItem> bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.list_alt),
      label: '分帳列表',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.add,color: Color.fromARGB(255, 57, 86, 89),),
      label: '分帳新增',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.people),
      label: '債務關係',
    ),
  ];

  //切換
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.data} 的${bottomNavBarItems[_selectedIndex].label}',
          style: const TextStyle(color: Color.fromARGB(255, 186, 217, 217)),
        ),
        automaticallyImplyLeading: false, //移除返回按鈕
        backgroundColor: const Color.fromARGB(255, 57, 86, 89),
      ),
      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 57, 86, 89), //背景顏色
        iconSize: 35,
        selectedIconTheme: const IconThemeData(
            color: const Color.fromARGB(255, 186, 217, 217)),
        selectedItemColor: const Color.fromARGB(255, 186, 217, 217),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: bottomNavBarItems,
        currentIndex: _selectedIndex, //預設初始Item
        onTap: _onItemTapped, //點選觸發_onItemTapped方法
      ),
      floatingActionButton: SizedBox(
          height: 70,
          width: 70,
          child: FloatingActionButton(
            child: const Icon(
              Icons.add,
              size: 50,
            ),
            backgroundColor: const Color.fromARGB(255, 242, 187, 119),
            foregroundColor: const Color.fromARGB(255, 57, 86, 89),
            onPressed: () {
              _onItemTapped(1);
            },
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}





