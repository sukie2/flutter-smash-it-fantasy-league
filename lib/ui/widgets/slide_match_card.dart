import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smash_it/constants/size_constants.dart';

class SlideMatchCard extends StatelessWidget {
  final String img;
  final String title;
  final String address;
  final String rating;

  SlideMatchCard({
    required this.img,
    required this.title,
    required this.address,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Sizes.base, bottom: Sizes.base),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Sizes.base)),
          elevation: 3.0,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 10,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Sizes.baseHalf),
                        topRight: Radius.circular(Sizes.baseHalf),
                      ),
                      child: Image(
                        height: 30,
                        width: 60,
                        fit: BoxFit.scaleDown,
                        image: AssetImage(img),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 6.0,
                    right: 6.0,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0)),
                      child: Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 10,
                            ),
                            Text(
                              "$rating",
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 6.0,
                    left: 6.0,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0)),
                      child: Padding(
                        padding: EdgeInsets.all(Sizes.baseHalf),
                        child: Text(
                          " OPEN ",
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Sizes.base),
              Padding(
                padding: EdgeInsets.only(left: Sizes.base2x),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(height: Sizes.base),
              Padding(
                padding: EdgeInsets.only(left: Sizes.base2x),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    address,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              SizedBox(height: Sizes.base),
            ],
          ),
        ),
      ),
    );
  }
}
