import 'package:flutter/material.dart';
import 'package:povider/model/hng_model.dart';
import 'package:povider/view/news_temp.dart';
import 'package:povider/view_model/news_view_model.dart';
import 'package:provider_architecture/provider_architecture.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget { 

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<NewsViewModel>.withConsumer(
      viewModelBuilder: () => NewsViewModel(),
      onModelReady: (model) => model.getNews(),
      builder: (context, model, _) => Scaffold(
        appBar: AppBar(elevation: 0, backgroundColor: Colors.white,),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: model.hng.length,
            itemBuilder: (context, index){
              return Template(
                name: Text(model.hng[index].title),
                id: Text(model.hng[index].author),
                status: Text(model.hng[index].publishedAt.toString())
              );
            }
          ),
        ),
      ),
    );
  }
}
