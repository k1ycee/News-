import 'package:flutter/material.dart';
import 'package:povider/view_model/business_view_model.dart';
import 'package:povider/widgets/vertical_new_item.dart';
import 'package:provider_architecture/provider_architecture.dart';

class Business extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<BusinessViewModel>.withConsumer(
      viewModelBuilder: () => BusinessViewModel(),
      onModelReady: (model) => model.getBusiness(),
      builder: (context, model, _) => Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: model.busin.length,
            itemBuilder: (context, index) => BottomNewsWidget(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width/4,
              title: Text(model.busin[index].title == null ? '' : model.busin[index].title),
              author: Text(model.busin[index].author == null ? '' : model.busin[index].author),
              image: '${model.busin[index].urlToImage}',
            ),
          ),
        )
    );
  }
}
