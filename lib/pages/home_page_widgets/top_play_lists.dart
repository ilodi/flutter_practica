import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:practica/models/play_list.dart';
import 'package:practica/utils/extras.dart';

class TopPlayLists extends StatefulWidget {
  final List<PlayList> items;
  TopPlayLists({Key key, @required this.items})
      : assert(items != null && items.length > 0),
        super(key: key);

  @override
  _TopPlayListsState createState() => _TopPlayListsState();
}

class _TopPlayListsState extends State<TopPlayLists> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(top: 20, left: 10, bottom: 10),
            child: Text(
              "Para Flutter Devs",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            )),
        Container(
          height: 230,
          child: PageView(
            children: List.generate(
              widget.items.length,
              (int index) {
                final PlayList item = widget.items[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 10),
                  ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: CachedNetworkImage(
                          imageUrl: item.banner,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(item.title,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(Extras.fromNow(item.publishedAt),
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300)),
                                  Text("Videos ${item.itemCount}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300))
                                ],
                              )
                            ]),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
