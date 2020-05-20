import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practica/blocs/pages/master_bloc/master_bloc.dart';
import 'package:practica/blocs/pages/master_bloc/master_state.dart';
import 'package:practica/models/youtube_video.dart';
import 'package:practica/widgets/youtube_view_item.dart';

class PageB extends StatefulWidget {
  PageB({Key key}) : super(key: key);

  @override
  _PageBState createState() => _PageBState();
}

class _PageBState extends State<PageB> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MasterBloc, MasterState>(builder: (_, state) {
      if (state.history.length == 0) {
        return Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          SvgPicture.asset(
            'assets/icons/envio-y-entrega.svg',
            width: 80,
          ),
          SizedBox(
            height: 10,
          ),
          Text("No hay datos para mostrar")
        ]));
      }
      return ListView.builder(
        itemBuilder: (_, index) {
          final YouTubeVideo item = state.history[index];
          return YouTubeVideoItem(item: item);
        },
        itemCount: state.history.length,
      );
    });
  }
}
