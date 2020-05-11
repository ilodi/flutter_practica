import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomMenuItem {
  final String iconPath, label;
  final Widget content;

//llaves es para ser que sean opcionales
  BottomMenuItem(
      {@required this.iconPath, @required this.label, @required this.content});
}

class BottomMenu extends StatelessWidget {
  final List<BottomMenuItem> items;
  final int currentPage;
  final void Function(int) onChanged;
//como es final debe de de tener un constructor, para inicializar sus valores
  BottomMenu({@required this.items, @required this.currentPage, this.onChanged})
      : assert(items != null && items.length > 0),
        assert(currentPage != null && currentPage >= 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff7f7f7),
      padding: EdgeInsets.symmetric(vertical: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          items.length,
          (index) {
            final BottomMenuItem item = items[index];
            //Va a ser verdadero si index es igual a currenPage
            final bool isActive = index == currentPage;
            return Expanded(
              child: Container(
                child: CupertinoButton(
                  onPressed: () {
                    onChanged(index);
                  },
                  padding: EdgeInsets.zero,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SvgPicture.asset(item.iconPath,
                          width: 30, color: isActive ? Colors.blue : null),
                      SizedBox(height: 3),
                      Text(
                        item.label,
                        style: TextStyle(
                            fontSize: 10,
                            color: isActive ? Colors.black38 : Colors.white10),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
