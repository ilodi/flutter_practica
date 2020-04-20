import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practica/pages/login_page.dart';
import 'package:practica/utils/dialog.dart';
import 'package:practica/widgets/avatar.dart';
import 'package:practica/widgets/left_right_icon_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageC extends StatefulWidget {
  PageC({Key key}) : super(key: key);

  @override
  _PageCState createState() => _PageCState();
}

class _PageCState extends State<PageC> {
  _logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    //Borrar todo el historil de nav, este borrar todo hasta llegar a la nueva pagina
    //el_ es para no hacer uso de ese metodo
    Navigator.pushNamedAndRemoveUntil(
        context, LoginPage.routeName, (_) => false);
  }

  _confirm() async {
    //como es un metodo statico no necesita  crear una instancia
    final isOk = await Dialogs.confirm(
      context,
      body: 'Estas seguro de que deseas salir de su cuenta?',
      title: 'Estas apunto de irte',
    );

    if (isOk) {
      _logOut();
    }
  }

  _setEmail() {
    Dialogs.intputEmail(context, onOk: (String text) {
      print('inputdialog $text');
    }, label: 'Ingrese un email',
    placeholder:'email@email.com');
  }

  @override
  Widget build(BuildContext context) {
    /*   return Center(
      child: CupertinoButton(child: Text("Cerra sesión"), onPressed: _logOut),
    ); */
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: LayoutBuilder(
        builder: (BuildContext context, constaints) {
          return Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.grey,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      children: <Widget>[
                        Avatar(
                          size: 150,
                        ),
                        Text('Hola'),
                      ],
                    ),
                  ),
                  LeftRightIconButton(
                    label: 'Email',
                    leftIcon: 'assets/icons/mail.svg',
                    rightContent: Text(
                      'lodi@gmail.com',
                      style: TextStyle(
                          color: Color(0xFFaaaaaa), fontFamily: 'Montserrat'),
                    ),
                    onPressed: _setEmail,
                  ),
                  LeftRightIconButton(
                    label: 'Configuraciones de privacidad',
                    leftIcon: 'assets/icons/security.svg',
                    rightContent:
                        SvgPicture.asset('assets/icons/right.svg', width: 20),
                    onPressed: _confirm,
                  ),
                  LeftRightIconButton(
                    label: 'Notificaciones Push',
                    leftIcon: 'assets/icons/bell.svg',
                    rightContent: Text('ACTIVADO',
                        style: TextStyle(
                            color: Color(0xFFaaaaaa), letterSpacing: 0.5)),
                    onPressed: _confirm,
                  ),
                  LeftRightIconButton(
                    label: 'Cerrar sesión',
                    leftIcon: 'assets/icons/logout.svg',
                    onPressed: _confirm,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
