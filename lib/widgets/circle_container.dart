import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {


final Widget child;
//validar que sea un widget distinto de nulo  asser indicara una alerta que no lo esta haciendo bien puedes agregar todos los assert que queiras
   CircleContainer({this.child}):assert(child!=null);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0Xffecf0f3),
              Color(0Xffffffff),
            ],
          ),
          borderRadius: BorderRadius.circular(0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffecf0f3),
                    blurRadius: 3,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.all(55),
                child: FlutterLogo(),
              ),
            ),
          ],
        ));
  }
}
