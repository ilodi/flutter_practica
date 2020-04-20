import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageB extends StatefulWidget {
  PageB({Key key}) : super(key: key);

  @override
  _PageBState createState() => _PageBState();
}

class _PageBState extends State<PageB> {
  @override
  Widget build(BuildContext context) {
    //que calcule el espacio que tiene para renderizar
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constaints) {
        return Container(
          color: Colors.red,
          height: constaints.maxHeight/3,

          
        );
      },
    );
  }
}
