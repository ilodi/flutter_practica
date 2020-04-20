import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';

class Cronometer extends StatefulWidget {
  final double initTime, fontSize;

  const Cronometer({Key key, this.initTime = 0, this.fontSize = 13})
      : super(key: key);

  @override
  CronometerState createState() {
    return CronometerState();
  }
}

class CronometerState extends State<Cronometer> with AfterLayoutMixin {
  double _time;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _time = widget.initTime;
  }

//se ejecuta despues de initState
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void afterFirstLayout(BuildContext context) {
   
  }
  //se ejecuta siempre que el widget padre se modifica
@override
  void didUpdateWidget(Cronometer oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("old fontSize ${oldWidget.fontSize}");
    print("new fontSize ${widget.fontSize}");
  }
//donde se li.. recuros
  @override
  void dispose() {
    //cancelar timer
    super.dispose();
    _stop();
  }

//
  void _start() {
    //periodic es igual seTinter.. Js
    _timer = Timer.periodic(Duration(seconds: 1), (Timer _) {
      setState(() {
        _time += 1;
      });
    });
  }

//
  void _stop() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: <Widget>[
          Text(
            _time.toString(),
            style: TextStyle(fontSize: widget.fontSize),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CupertinoButton(
                child: Container(
                  color: Color(0xfff7f7f7),
                  child: Icon(Icons.play_arrow, size: 21),
                ),
                onPressed: _start,
              ),
              CupertinoButton(
                child: Container(
                  color: Color(0xfff7f7f7),
                  child: Icon(Icons.stop, size: 21),
                ),
                onPressed: _stop,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
