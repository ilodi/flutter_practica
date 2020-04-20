import 'package:flutter/material.dart';
import 'package:practica/widgets/my_appbar.dart';


class PostPage extends StatefulWidget {
  static final routeName = 'post';

  PostPage({Key key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<String> _data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: <Widget>[
              MyAppbar(
                leftIcon: 'https://image.flaticon.com/icons/svg/188/188923.svg',
                onLeftClick: () => Navigator.pop(context),
                rightIcon:
                    'https://image.flaticon.com/icons/svg/189/189012.svg',
                onRightClick: () {
                  setState(() {
                  /*   if (_data.length > 0) {
                      _data.insert(_data.length - 1, "item ${DateTime.now()}");
                    } else {
                      _data.add("item ${DateTime.now()}");
                    } */
                    _data.insert(_data.length > 0 ? _data.length -1 : 0, "item ${DateTime.now()}");
                  });
                  /*  setState(() {
                    _data.add("item ${DateTime.now()}");
                  }); */
                },
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int position) {
                    final String item = _data[position];
                    return ListTile(
                      title: Text(item),
                      subtitle: Text('Subtitulo'),
                      leading: Icon(Icons.category),
                      onTap: () {},
                      onLongPress: () {
                        setState(() {
                          _data.removeAt(position);
                        });
                      },
                    );
                  },
                  itemCount: _data.length,
                ),
                /* ListView(
                  children: /* List.generate(fakeList.length, (index){
                    final String item = fakeList[index];
                    return Text(item);
                  }, 
                  ),*/
                  fakeList.map<Widget>((String item){
                    return Text(item);
                  }).toList(),
                ), */
              ),
            ],
          ),
        ),
      ),
    );
  }
}
