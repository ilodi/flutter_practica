import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica/api/account_api.dart';
import 'package:practica/widgets/circle_container.dart';

class PageA extends StatefulWidget {
  PageA({Key key}) : super(key: key);

  @override
  _PageAState createState() => _PageAState();
}

//para mantener un estado ente pantallas necesita sun mixin y tener activado true en PageController with AutomaticKeepAliveClientMixin
class _PageAState extends State<PageA> {
//Api
  AccountAPI _accountAPI = AccountAPI();
  List<dynamic> _users = [];
  @override
  void initState() {
    super.initState();
    _load();
  }

  _load() async {
    final user = await _accountAPI.getUsers(1);
    setState(() {
      _users.addAll(user);
    });
  }

/*   bool _isEnabled = false;
  double _fontSize = 21; */
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          height: 120,
          child: ListView.builder(
            itemBuilder: (_, index) {
              final dynamic item = _users[index];
              return Padding(
                padding: EdgeInsets.all(8),
                child: Column(children: <Widget>[
                  Expanded(
                    child: ClipOval(
                      child: Image.network(
                        item['avatar'],
                      ),
                    ),
                  ),
                  Text(item['first_name']),
                ]),
              );
            },
            itemCount: _users.length,
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }
}
/*   @override
  // returna true para mantener el estado recuerda que esto puede hacer que consuma recursos
  bool get wantKeepAlive => true;
}*/
