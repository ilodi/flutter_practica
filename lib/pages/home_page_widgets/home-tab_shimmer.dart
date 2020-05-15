import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeTabShimmer extends StatelessWidget {
  const HomeTabShimmer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double itemWidth = MediaQuery.of(context).size.width * 0.75;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 120,
          child: ListView.builder(
            itemBuilder: (_, index) {
              return Shimmer(
                  period: Duration(seconds: 3),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffcccccc),
                          ),
                        ),
                        SizedBox(height: 3),
                      ],
                    ),
                  ),
                  gradient: LinearGradient(
                      colors: [Colors.white, Color(0xffeeeeee)]));
            },
            itemCount: 7,
            scrollDirection: Axis.horizontal,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20, left: 10, bottom: 10),
          child: Text(
            "Para Flutter Devs",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
        AspectRatio(
          aspectRatio: 7 / 4,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                3,
                (int index) {
                  return Container(
                    width: itemWidth,
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    margin: EdgeInsets.only(bottom: 15),
                    //margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 10),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Shimmer.fromColors(
                            child: Container(
                              color: Color(0xffcccccc),
                            ),
                            baseColor: Color(0xffcccccc),
                            highlightColor: Color(0xffaaaaaa),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Shimmer.fromColors(
                                child: Container(
                                  height: 15,
                                  width: 100,
                                  color: Colors.black26,
                                ),
                                baseColor: Color(0xffcccccc),
                                highlightColor: Color(0xffaaaaaa),
                              ),
                              Shimmer.fromColors(
                                child: Container(
                                  height: 15,
                                  margin: EdgeInsets.only(top: 5),
                                  width: double.infinity,
                                  color: Colors.black26,
                                ),
                                baseColor: Color(0xffcccccc),
                                highlightColor: Color(0xffaaaaaa),
                              ),
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
      ],
    );
  }
}
