import 'package:flutter/material.dart';
//import 'package:nuts_activity_indicator/nuts_activity_indicator.dart';
import 'package:practica/widgets/my_appbar.dart';
//import 'package:cached_network_image/cached_network_image.dart';

//1) Crear una clase para mandarle argumentos cuando se usa pushNamed
class ImagesPageArgs {
  final String username;
  final bool isActive;

  ImagesPageArgs({@required this.username, @required this.isActive});
}

class ImagesPage extends StatefulWidget {
//3) decirle a la ruta que esta es la pagina page para los arguments
  static final routeName = 'images';

  @override
  _ImagesPageState createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  @override
  Widget build(BuildContext context) {
//2) mandar el contexto para que pueda hacer unso de
    // final ImagesPageArgs args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
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
                onRightClick: () {},
              ),
              Expanded(
                child: GridView.builder(
                  //genera los espac..
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.cyan,
                      alignment: Alignment.center,
                      child: Text("${index + 1}"),
                    );
                  },
                  itemCount: 100,
                ),

                //*esta solo se recomienda para pocos elementos
                /*  GridView.count(
                  //numero de colmpnas
                  crossAxisCount: 4,
                  //Espacios entre lineas Row
                  crossAxisSpacing: 10,
                  //Espacios Colums
                  mainAxisSpacing: 10,
                  children: List.generate(
                    50,
                    (index) {
                      return Container(
                        color: Colors.cyan,
                        alignment: Alignment.center,
                        child: Text("${index+1}"),
                      );
                    },
                  ),
                ), */
              ),
            ],
          ),
        ),
      ),
    );
  }
}
