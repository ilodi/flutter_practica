import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practica/blocs/pages/master_bloc/master_bloc.dart';
import 'package:practica/pages/images_page.dart';
import 'package:practica/pages/login_page.dart';
import 'package:practica/pages/post_page.dart';
import 'package:practica/pages/splash_pages.dart';
import './pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//services pack
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MasterBloc(),
        ),
      ],
      child: GestureDetector(
        onTap: () {
          final FocusScopeNode focus = FocusScope.of(context);

          if (!focus.hasPrimaryFocus) {
            focus.unfocus();
          }
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Montserrat'),
          home: SplashPage(),
          routes: {
            HomePage.routeName: (BuildContext context) => HomePage(),
            ImagesPage.routeName: (BuildContext context) => ImagesPage(),
            PostPage.routeName: (BuildContext context) => PostPage(),
            LoginPage.routeName: (BuildContext context) => LoginPage()
          },
        ),
      ),
    );
  }
}
