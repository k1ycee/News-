import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:povider/utils/colors.dart';
import 'package:povider/view/business.dart';
import 'package:povider/widgets/horizontal_news_item.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

import '../view_model/news_view_model.dart';


// TODO: Check requirements.txt so that things won't break into pieces for IOS. Thanks in anticipation Sir
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<NewsViewModel>.withConsumer(
      viewModelBuilder: () => NewsViewModel(),
      onModelReady: (model) => model.getNews(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
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
        body: ListView(
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
              child: model.hng.length == 0 ? Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(textDarker),)) :  ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: model.hng.length,
                itemBuilder: (context, index) => TopNewsWidget(
                  model.hng[index],
                  index,
                  model.hng.length,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Business",
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
            Business()
          ],
        ),
      ),
    );
  }
}
