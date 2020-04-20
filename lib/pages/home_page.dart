import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:practica/pages/chat_page.dart';
import 'package:practica/pages/images_page.dart';
import 'package:practica/widgets/bottom_menu.dart';
import 'package:practica/widgets/my_appbar.dart';
import 'package:practica/widgets/my_page_view.dart';

import 'home_page_tabs/pageA_tab.dart';
import 'home_page_tabs/pageB_tab.dart';
import 'home_page_tabs/pageC_tab.dart';

class HomePage extends StatefulWidget {
  static final routeName = "home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;

  final _menu = [
    BottomMenuItem(
        content: PageA(),
        iconPath: 'assets/icons/bullbasaur.svg',
        label: 'bullbasaur'),
    BottomMenuItem(
        content: PageB(),
        iconPath: 'assets/icons/squirtle.svg',
        label: 'squirtle'),
    BottomMenuItem(
        content: PageC(),
        iconPath: 'assets/icons/charmander.svg',
        label: 'charmander'),
  ];

  @override
  void initState() {
    super.initState();
  }

//dispose libera recuersos
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*   appBar: AppBar(
        brightness: Brightness.light ,
        backgroundColor: Color(0xfff7f7f7),
        elevation: 0,
        title: Text('Logo', style: TextStyle(color: Colors.cyanAccent),),
        
        iconTheme: IconThemeData(color:Colors.cyan),
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more), onPressed: () {}),
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ), */
      bottomNavigationBar: BottomMenu(
        currentPage: _currentPage,
        onChanged: (int newCurrentPage) {
          setState(() {
            _currentPage = newCurrentPage;
            //.conatins va a decir si el elemento existe
            /*    if (!_renderedTabs.contains(newCurrentPage)) {
              _renderedTabs.add(newCurrentPage);
            } */
          });
        },
        items: _menu,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              //appbar
              MyAppbar(
                leftIcon: 'https://image.flaticon.com/icons/svg/188/188919.svg',
                onLeftClick: () {
                  Navigator.pushNamed(context, ImagesPage.routeName,
                      arguments: ImagesPageArgs(
                        username: 'lodi',
                        isActive: true,
                      ));
                },
                rightIcon:
                    'https://image.flaticon.com/icons/svg/188/188921.svg',
                onRightClick: () {
                  final route = MaterialPageRoute(
                    builder: (BuildContext _) => ChatPage(
                      username: 'lodo',
                    ),
                  );
                  Navigator.push(context, route);
                },
              ),
              Expanded(
                  child: MyPageView(
                children: _menu.map<Widget>((item) => item.content).toList(),
                currentPage: _currentPage,
              )),
            ],
          ),
        ),
      ),
    );
  }
}