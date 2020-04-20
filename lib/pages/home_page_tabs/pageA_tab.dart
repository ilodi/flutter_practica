import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PageA extends StatefulWidget {
  PageA({Key key}) : super(key: key);

  @override
  _PageAState createState() => _PageAState();
}

//para mantener un estado ente pantallas necesita sun mixin y tener activado true en PageController with AutomaticKeepAliveClientMixin
class _PageAState extends State<PageA> {
/*   bool _isEnabled = false;
  double _fontSize = 21; */
  @override
  Widget build(BuildContext context) {
    
    return Text("Home");

  }
}
/*   @override
  // returna true para mantener el estado recuerda que esto puede hacer que consuma recursos
  bool get wantKeepAlive => true;
}*/
