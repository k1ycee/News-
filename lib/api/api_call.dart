import 'dart:async';

import 'package:http/http.dart' as caller;
import 'package:povider/model/business_model.dart';
import 'dart:convert';

import 'package:povider/model/hng_model.dart';



class NewsCall{

  


  Future<List<Article>> news() async{
      final String url = 'http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=0033eec1ce834b8f93dbd041496980c9';
      var getPeople = await caller.get(url);
      if(getPeople.statusCode == 200){
       return News.fromJson(jsonDecode(getPeople.body)).articles;
      }
    return null;
  }

  Future<List<BusinessArticle>> business() async{
    final String url = 'http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=0033eec1ce834b8f93dbd041496980c9';
      var getPeople = await caller.get(url);
      if(getPeople.statusCode == 200){
       return BusinessNews.fromJson(jsonDecode(getPeople.body)).articles;
      }
    return null;
  }

}