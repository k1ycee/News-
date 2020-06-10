import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "News",
                    style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                      color: textDarker,
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    )),
                  ),
                  Container(
                    height: 20,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: background),
                    child: Center(child: Text("Some")),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: model.hng.length,
                itemBuilder: (context, index)=> Container(
                  child: Stack(children: <Widget>[

                  ],),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
