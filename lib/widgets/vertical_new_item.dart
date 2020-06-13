import 'package:flutter/material.dart';
import 'package:povider/utils/colors.dart';

class BottomNewsWidget extends StatefulWidget {
  final double height;
  final double width;
  final Text title;
  final Text date;
  final Text author;
  final String image;

  const BottomNewsWidget(
      {Key key,
      this.height,
      this.width,
      this.title,
      this.date,
      this.author,
      this.image})
      : super(key: key);

  @override
  _BottomNewsWidgetState createState() => _BottomNewsWidgetState();
}

class _BottomNewsWidgetState extends State<BottomNewsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Padding(
        padding: const EdgeInsets.only(bottom:8.0),
        child: ListTile(
          leading: Container(
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                transBlack20,
                transBlack40,
                transBlack60,
                transBlack80,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(widget.image == null
                      ? Container(
                          height: widget.height,
                          width: widget.width,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    transBlack20,
                                    transBlack40,
                                    transBlack60,
                                    transBlack80,
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                              borderRadius: BorderRadius.circular(10)),
                        )
                      : widget.image),
                  fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}
