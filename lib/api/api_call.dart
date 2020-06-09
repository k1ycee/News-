import 'dart:async';

import 'package:http/http.dart' as caller;
import 'dart:convert';

import 'package:povider/model/hng_model.dart';



class NewsCall{

  final String url = 'http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=0033eec1ce834b8f93dbd041496980c9';


    Future<List<Article>> news() async{
      var getPeople = await caller.get(url);
      if(getPeople.statusCode == 200){
       return News.fromJson(jsonDecode(getPeople.body)).articles;
      }
    return null;
  }
}