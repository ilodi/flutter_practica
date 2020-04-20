import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Avatar extends StatefulWidget {
  final double size;

  const Avatar({Key key, this.size = 150}) : super(key: key);
  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
//
  File _file;

//metodo privado para img piker
  _pickImage() async {
    final File file = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _file = file;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      child: Stack(
        children: <Widget>[
          _file == null
              ? SvgPicture.asset('assets/icons/pokeball.svg')
              : ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.file(_file,
                      height: 200, width: 200, fit: BoxFit.cover),
                ),

          //Posi.. solo puede ser usado en una lista con un widget stack
          Positioned(
            top: 0,
            right: 0,
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              child: Icon(Icons.edit),
              minSize: 30,
              onPressed: _pickImage,
            ),
          ),
        ],
      ),
    );
  }
}
