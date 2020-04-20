import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyBtn extends StatelessWidget {
  final String label;
  final Color colorBtn, txtColor;
  final bool fullWidth;
  final VoidCallback onPressed;
  final EdgeInsets padding;

  const MyBtn(
      {Key key,
      @required this.label,
      this.txtColor,
      @required this.onPressed,
      this.colorBtn,
      this.fullWidth = false, this.padding})
      : assert(label != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minSize: 30,
      padding: EdgeInsets.zero,
      child: Container(
        width: fullWidth ? double.infinity : null,
        //tomas ese valor si no el de por defecto
        padding: this.padding ?? EdgeInsets.symmetric(vertical: 18, horizontal: 30),
        child: Text(
          this.label,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: this.txtColor ?? Colors.black,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5),
        ),
        decoration: BoxDecoration(
            color: this.colorBtn ?? Colors.white,
            borderRadius: BorderRadius.circular(34),
            boxShadow: [
              BoxShadow(
                color: Color(0xffD1D9E6),
                blurRadius: 10,
                offset: Offset(0,5),
              ),
            ]),
      ),
      onPressed: () {
        FocusScope.of(context).unfocus();
        this.onPressed();
      },
    );
  }
}
