import 'package:flutter/material.dart';
import 'package:flutterapplearntowrite/ui/home/notification/notification.dart';
import 'package:flutterapplearntowrite/ui/home/search/search.dart';
import 'package:flutterapplearntowrite/ui/home/user/user.dart';

///tab 页面
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectIndex = 0;

  List<Widget> _tabs = <Widget>[
    SearchTabPage(),
    NotificationPage(),
    UserPage()
  ];

  _onTabClick(int index){
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          brightness: Theme.of(context).platform == TargetPlatform.android
              ? Brightness.dark
              : Brightness.light,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        preferredSize: Size.fromHeight(0),
      ),
      body: IndexedStack(
        index: _selectIndex,
        children: _tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.search),title: Text
            ('Search')),
          BottomNavigationBarItem(icon: Icon(Icons.notifications),title: Text
            ('Notifications')),
          BottomNavigationBarItem(icon: Icon(Icons.person),title: Text
            ('User')),
        ],
        onTap: _onTabClick,
        currentIndex: _selectIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 17,
        unselectedFontSize: 17,
      ),
    );
  }
}

