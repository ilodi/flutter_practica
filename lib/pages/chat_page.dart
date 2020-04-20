import 'package:flutter/material.dart';
import 'package:practica/widgets/my_appbar.dart';

class ChatPage extends StatefulWidget {

  final String username;

  ChatPage({Key key, @required this.username}) : assert(username!=null), super(key: key);



  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(children: <Widget>[
          MyAppbar(
            leftIcon: 'https://image.flaticon.com/icons/svg/188/188923.svg',
            onLeftClick: ()=> Navigator.pop(context),
            rightIcon: 'https://image.flaticon.com/icons/svg/189/189012.svg',
            onRightClick: () {},
          ),
          Expanded(child: Center(
            child: Text(widget.username ?? 'es null')

          ),)
        ],),
      ),),
    );
  }
}
