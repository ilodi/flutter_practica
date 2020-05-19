import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nuts_activity_indicator/nuts_activity_indicator.dart';
import 'package:practica/api/account_api.dart';
import 'package:practica/pages/home_page.dart';
import 'package:practica/utils/dialog.dart';
import 'package:practica/widgets/my_btn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../blocs/pages/Login/bloc.dart';

class LoginPage extends StatefulWidget {
  static final routeName = "login";
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //bloc
  LoginBloc _loginBloc = LoginBloc();

  FocusNode _focusNodePassword = FocusNode();

  GlobalKey<FormState> _formKey = GlobalKey();
  String _email = '', _password = '';

  @override
  void dispose() {
    _focusNodePassword.dispose();
    _loginBloc.close();
    super.dispose();
  }

  _submit() async {
    //validar
    final bool isValid = _formKey.currentState.validate();
    if (isValid) {
      _loginBloc.add(LoginByPassword(
          context: context, email: _email, password: _password));
    }
  }

  String _validateEmail(String email) {
    if (email.isNotEmpty && email.contains("@")) {
      _email = email;
      return null;
    }
    return "Invalid email";
  }

  String _validatePassword(String password) {
    if (password.isNotEmpty && password.length > 4) {
      _password = password;
      return null;
    }
    return "Invalid password";
  }

  @override
  Widget build(BuildContext context) {
    //un mejor responsi..
    final MediaQueryData media = MediaQuery.of(context);
    final Size size = media.size;
    final EdgeInsets padding = media.padding;

    return BlocProvider.value(
      value: _loginBloc,
      child: Scaffold(
        body: SafeArea(
            child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Container(
                  height: size.height - padding.top - padding.bottom,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          child: Image.network(
                            'https://placeholder.com/wp-content/uploads/2018/10/placeholder.com-logo4.png',
                            width: 230,
                          ),
                        ),
                      ),
                      ConstrainedBox(
                        constraints:
                            BoxConstraints(maxWidth: 330, minWidth: 200),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                decoration: InputDecoration(
                                  //es como un placeholder
                                  hintText: "email@email.com",
                                  labelText: "email",
                                  prefixIcon: Container(
                                    width: 70,
                                    height: 40,
                                    padding: EdgeInsets.all(10),
                                    child: SvgPicture.asset(
                                      'assets/icons/mail.svg',
                                      color: Colors.black26,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(34),
                                  ),
                                ),
                                initialValue: 'eve.holt@reqres.in',
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                validator: _validateEmail,
                                onFieldSubmitted: (String text) {
                                  _focusNodePassword.nextFocus();
                                },
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "******",
                                    labelText: "password",
                                    prefixIcon: Container(
                                      width: 70,
                                      height: 40,
                                      padding: EdgeInsets.all(10),
                                      child: SvgPicture.asset(
                                        'assets/icons/password.svg',
                                        color: Colors.black26,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(34)),
                                  ),
                                  initialValue: 'cityslicka',
                                  focusNode: _focusNodePassword,
                                  textInputAction: TextInputAction.send,
                                  validator: _validatePassword,
                                  onFieldSubmitted: (String text) {
                                    _submit();
                                  },
                                  obscureText: true),
                              SizedBox(height: 5),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    CupertinoButton(
                                      padding: EdgeInsets.zero,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                        ),
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 1,
                                                  color: Colors.blueGrey)),
                                        ),
                                        child: Text('Recuperar Contraseña',
                                            style: TextStyle(
                                                color: Color(0xff304FFE))),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ]),
                              SizedBox(height: 30),
                              MyBtn(
                                label: "INGRESAR",
                                fullWidth: true,
                                colorBtn: Color(0xff304FFE),
                                txtColor: Colors.white,
                                onPressed: _submit,
                              ),
                              SizedBox(height: 30),
                              Text("O inicia con"),
                              SizedBox(height: 10),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: MyBtn(
                                      label: "FACEBOOK",
                                      fullWidth: true,
                                      colorBtn: Color(0xff0D47a1),
                                      txtColor: Colors.white,
                                      onPressed: () {},
                                      padding: EdgeInsets.symmetric(
                                          vertical: 18, horizontal: 10),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: MyBtn(
                                      label: "GOOGLE",
                                      fullWidth: true,
                                      colorBtn: Color(0xffF50057),
                                      txtColor: Colors.white,
                                      onPressed: () {},
                                      padding: EdgeInsets.symmetric(
                                          vertical: 18, horizontal: 10),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (_, state) {
                if (state.fetching) {
                  return Positioned.fill(
                    child: Container(
                      color: Colors.white70,
                      child: Center(
                        child: NutsActivityIndicator(
                          radius: 55,
                          activeColor: Colors.cyan,
                          inactiveColor: Colors.cyanAccent,
                          tickCount: 4,
                          startRatio: 0.64,
                          animationDuration: Duration(seconds: 1),
                        ),
                      ),
                    ),
                  );
                }
                return Container();
              },
              condition: (prevState, newState) =>
                  prevState.fetching != newState.fetching,
            ),
          ],
        )),
      ),
    );
  }
}
