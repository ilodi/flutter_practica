import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
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
  PageController _controller =
      PageController(initialPage: 0, viewportFraction: 0.5);
  ValueNotifier<int> _currentPage = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Build TopPlayList');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(top: 20, left: 10, bottom: 10),
            child: Text(
              "Para Flutter Devs",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            )),
        AspectRatio(
          aspectRatio: 8 / 5,
          child: Container(
            child: PageView(
              controller: _controller,
              onPageChanged: (int page) {
                _currentPage.value = page;
              },
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
                                  Text(
                                    Extras.fromNow(item.publishedAt),
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Text(
                                    "Videos ${item.itemCount}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        CupertinoButton(
            child: Text('Prev page'),
            onPressed: () {
              _controller.previousPage(
                  duration: Duration(milliseconds: 500), curve: Curves.easeInQuad);
            }),
            CupertinoButton(
            child: Text('Next page'),
            onPressed: () {
              _controller.nextPage(
                  duration: Duration(milliseconds: 500), curve: Curves.easeInQuad);
            }),
        ValueListenableBuilder(
          valueListenable: _currentPage,
          builder: (BuildContext context, int value, w) {
            return Dots(count: widget.items.length, currentPage: value);
          },
        ),
      ],
    );
  }
}

class Dots extends StatelessWidget {
  final int count, currentPage;
  const Dots({Key key, @required this.count, @required this.currentPage})
      : assert(count != null && count > 0),
        assert(currentPage != null && currentPage >= 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) {
          return Container(
            width: 10,
            height: 10,
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                color: currentPage == index ? Colors.black : Colors.black12,
                shape: BoxShape.circle),
          );
        },
      ),
    );
  }
}
