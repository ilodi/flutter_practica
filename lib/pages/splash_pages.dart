import 'package:flutter/material.dart';
import 'package:nuts_activity_indicator/nuts_activity_indicator.dart';
import 'package:practica/pages/home_page.dart';
import 'package:practica/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    //setTime para esperar
    Future.delayed(Duration(seconds: 2)).then((_) {
      //va a ver las preferencias
      this._chekLogin();
    });
  }

  _chekLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //buscara en las preferencias
    final bool wasLogin = prefs.getBool("wasLogin");

    print("wasLogin $wasLogin");

    if (wasLogin == null || wasLogin == false) {
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    } else {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: NutsActivityIndicator(
          radius: 55,
          activeColor: Colors.cyan,
          inactiveColor: Colors.cyanAccent,
          tickCount: 3,
          startRatio: 0.64,
          animationDuration: Duration(seconds: 1),
        ),
      ),
    );
  }
}
