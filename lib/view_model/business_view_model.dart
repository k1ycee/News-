
import 'package:flutter/material.dart';
import 'package:povider/api/api_call.dart';
import 'package:povider/model/business_model.dart';

class BusinessViewModel extends ChangeNotifier{


  List<BusinessArticle> busin = List<BusinessArticle>();


    Future <void> getBusiness()async{
    var some = await NewsCall().business();
    this.busin = some;
    notifyListeners();
  }

}
