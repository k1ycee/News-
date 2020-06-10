import 'package:flutter/material.dart';
import 'package:povider/api/api_call.dart';
import 'package:povider/model/business_model.dart';
import 'package:povider/model/hng_model.dart';

class NewsViewModel extends ChangeNotifier{


  List<Article> hng = List<Article>();
  List<BusinessArticle> busin = List<BusinessArticle>();

  Future <void> getNews()async{
    var some = await NewsCall().news();
    this.hng = some;
    notifyListeners();
  }

    Future <void> getBusiness()async{
    var some = await NewsCall().business();
    this.busin = some;
    notifyListeners();
  }
}