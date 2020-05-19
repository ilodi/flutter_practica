import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginTextFormField extends StatelessWidget {
  final FocusNode focusNode;
  final String iconPath, initialValue, hintText, labelText;
  final String Function(String) validator;
  final void Function(String) onFieldSubmitted;
  final bool obscureText;

  const LoginTextFormField(
      {Key key,
      @required this.iconPath,
      @required this.validator,
      @required this.onFieldSubmitted,
      this.initialValue = '',
      this.hintText = '',
      this.labelText = '',
      this.focusNode,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
          //es como un placeholder
          hintText: this.hintText,
          labelText: this.labelText,
          prefixIcon: Container(
            width: 70,
            height: 40,
            padding: EdgeInsets.all(10),
            child: SvgPicture.asset(
              this.iconPath,
              color: Colors.black26,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(34),
          ),
        ),
        initialValue: this.initialValue,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        validator: this.validator,
        focusNode: this.focusNode,
        obscureText: this.obscureText,
        onFieldSubmitted: this.onFieldSubmitted);
  }
}
