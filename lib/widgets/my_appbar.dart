import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class MyAppbar extends StatelessWidget {
  final String leftIcon, rightIcon;
  final VoidCallback onLeftClick, onRightClick;

  MyAppbar({Key key, @required this.leftIcon, @required this.rightIcon, this.onLeftClick,  this.onRightClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      color: Color(0xfff7f7f7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CupertinoButton(
              child: SvgPicture.network(
                leftIcon,
                width: 30,
              ),
              padding: EdgeInsets.all(13),
              onPressed:onLeftClick),
          Text(
            'Pokemon Api',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.w300),
          ),
          CupertinoButton(
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(1),
                  child: SvgPicture.network(
                    rightIcon,
                    width: 30,
                  ),
                ),
                Positioned(
                    right: 20,
                    top: 20,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                    )),
              ],
            ),
            padding: EdgeInsets.all(13),
            onPressed: onRightClick,
          ),
        ],
      ),
    );
  }
}
