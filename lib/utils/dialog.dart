import 'dart:async';
import 'package:meta/meta.dart' show required;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogOption {
  final String label;
  final dynamic value;

  DialogOption({@required this.label, @required this.value});
}

class Dialogs {
  static Future<void> alert(BuildContext context,
      {String title, String body, String okText = 'Aceptar'}) async {
    //Ayuda para saber si algo se completo bien
    //es una tarea pendiente
    Completer<void> c = Completer();

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
              title: title != null ? Text(title) : null,
              content: body != null ? Text(body) : null,
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    okText,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    //al dar click le dices que ya se complemento y podra seguir el codigo
                    c.complete();
                  },
                ),
              ]);
        });

//mas la acction
    return c.future;
  }

  static Future<bool> confirm(BuildContext context,
      {String title,
      String body,
      String confirmText = "Aceptar",
      String cancerText = "Cancelar"}) async {
    final Completer<bool> c = Completer();
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          //es como otra pagina y se unsa navigator
          return AlertDialog(
            title: title != null ? Text(title) : null,
            content: body != null ? Text(body) : null,
            actions: <Widget>[
              FlatButton(
                child: Text(
                  confirmText,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  //despues de mini... saldra
                  c.complete(true);
                },
              ),
              FlatButton(
                child: Text(
                  cancerText,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 17,
                      fontWeight: FontWeight.w300),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  //despues de mini... saldra
                  c.complete(false);
                },
              ),
            ],
          );
        });
    return c.future;
  }

  static void intput(BuildContext context,
      {String label,
      String placeholder,
      @required void Function(String) onOk}) {
    String text = '';

    showCupertinoModalPopup(
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
              title: label != null ? Text(label) : null,
              content: CupertinoTextField(
                placeholder: placeholder,
                onChanged: (String _text) {
                  text = _text;
                },
              ),
              actions: <Widget>[
                CupertinoButton(
                    child: Text('Aceptat'),
                    onPressed: () {
                      Navigator.pop(context);
                      onOk(text);
                    })
              ]);
        });
  }

  static void intputEmail(BuildContext context,
      {String label,
      String placeholder,
      @required void Function(String) onOk}) {
    showCupertinoModalPopup(
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
            title: label != null
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(label),
                  )
                : null,
            content: InputEmail(
              placeholder: placeholder,
              onOk: (text) {
                if (onOk != null) {
                  onOk(text);
                }
              },
            ),
          );
        });
  }
}

class InputEmail extends StatefulWidget {
  final String placeholder;
  final void Function(String) onOk;

  InputEmail({Key key, this.placeholder, @required this.onOk})
      : super(key: key);

  @override
  _InputEmailState createState() => _InputEmailState();
}

class _InputEmailState extends State<InputEmail> {
  String _email = '';

  bool _validate() {
    return _email.contains("@");
  }

  @override
  Widget build(BuildContext context) {
    final isValid = _validate();

    return Container(
      alignment: Alignment.center,
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        CupertinoTextField(
          decoration: BoxDecoration(color: Colors.grey),
          placeholder: widget.placeholder,
          onChanged: (String _text) {
            _email = _text;
            _validate();
            setState(() {});
          },
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Expanded(
            child: FlatButton(
              child: Text(
                "Cancelar",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.pop(context);
                //Si todo esta bien
                widget.onOk(_email);
              },
            ),
          ),
          Expanded(
            child: FlatButton(
              child: Text("Aceptar",
                  style: TextStyle(color: isValid ? Colors.blue : Colors.grey)),
              onPressed: isValid
                  ? () {
                      Navigator.pop(context);
                    }
                  : null,
            ),
          )
        ])
      ]),
    );
  }

  static Future<bool> select(BuildContext context,
      {String title,
      String body,
      @required List<DialogOption> options,
      String cancerText = "Cancelar"}) async {
    final Completer<dynamic> c = Completer();
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          //es como otra pagina y se unsa navigator
          var options2 = options;
          return AlertDialog(
            title: title != null ? Text(title) : null,
            content: body != null ? Text(body) : null,
            actions: <Widget>[
              List.generate(options.length, (index) {
                final DialogOption option = options[index];
                return FlatButton(
                  onPressed: () {},
                  child: Text(option.label),
                );
              }),
              FlatButton(
                child: Text(
                  cancerText,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 17,
                      fontWeight: FontWeight.w300),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  //despues de mini... saldra
                  c.complete(null);
                },
              ),
            ],
          );
        });
    return c.future;
  }
}
