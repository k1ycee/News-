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
            SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Tech Crunch",
                    style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                      color: textDarker,
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    )),
                  ),
                  Container(
                    height: 32,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: background),
                    child: Center(
                        child: Text(
                      "Show all",
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: text,
                        ),
                      ),
                    )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: model.hng.length,
                itemBuilder: (context, index) => Padding(
                  padding: index == 0
                      ? const EdgeInsets.only(
                          top: 8.0,
                          bottom: 8.0,
                          left: 20.0,
                          right: 15.0,
                        )
                      : index == model.hng.length - 1
                          ? const EdgeInsets.only(
                              top: 8.0,
                              bottom: 8.0,
                              left: 15.0,
                              right: 20.0,
                            )
                          : const EdgeInsets.only(
                              top: 8.0,
                              bottom: 8.0,
                              left: 15.0,
                              right: 15.0,
                            ),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 0.82,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(model.hng[index].urlToImage),
                          fit: BoxFit.cover),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: LinearGradient(
                                colors: [
                                  transBlack20,
                                  transBlack40,
                                  transBlack60,
                                  transBlack80,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 65,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                model.hng[index].title,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      height: 1,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 24.0),
                              child: Text(
                                model.hng[index].author,
                                style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
