import 'package:flutter/material.dart';
import 'package:povider/utils/colors.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

import '../view_model/news_view_model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<NewsViewModel>.withConsumer(
      viewModelBuilder: () => NewsViewModel(),
      onModelReady: (model) => model.getNews(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Image(
            image: AssetImage('images/newyork.png'),
            width: 250,
          ),
          centerTitle: false,
          actions: <Widget>[
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding:
                    const EdgeInsets.only(right: 16.0, top: 8.0, bottom: 8.0),
                child: Container(
                  height: 30,
                  width: 38,
                  decoration: BoxDecoration(
                      color: background,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Icon(
                    Icons.search,
                    size: 20,
                    color: text,
                  ),
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}
