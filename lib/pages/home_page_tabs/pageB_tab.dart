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
    return AspectRatio(
        //el primer valor es el ancho y el segundo el alto
        aspectRatio: 7 / 4,
        child: Container(
          color: Colors.red,
          child: Image.network(
              'https://images7.alphacoders.com/103/1030536.jpg',
                fit: BoxFit.cover,
              ),
        ));
  }
}
