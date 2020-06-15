import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:povider/utils/colors.dart';
import 'package:povider/utils/styles.dart';
import 'package:povider/view_model/business_view_model.dart';
import 'package:provider_architecture/provider_architecture.dart';

class Business extends StatefulWidget {
  @override
  _BusinessState createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  FlutterWebviewPlugin webview = FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<BusinessViewModel>.withConsumer(
      viewModelBuilder: () => BusinessViewModel(),
      onModelReady: (model) => model.getBusiness(),
      builder: (context, model, _) => Container(
        height: MediaQuery.of(context).size.height * 0.375,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: model.busin.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebviewScaffold(
                      url: model.busin[index].url,
                      appBar: AppBar(
                        leading: IconButton(
                          icon: Icon(Icons.keyboard_backspace),
                          onPressed: () async {
                            await webview.close();
                            Navigator.pop(context);
                            webview.dispose();
                          },
                        ),
                        centerTitle: true,
                        title: Text(model.busin[index].title),
                        backgroundColor: textDarker,
                      ),
                      withJavascript: true,
                      withLocalStorage: true,
                      withZoom: true,
                      initialChild: Center(
                        child: SpinKitChasingDots(color: textDarker, size: 50),
                      ),
                    ),
                  ));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: Container(
                height: 100,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 5.0),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                transBlack20,
                                transBlack40,
                                transBlack60,
                                transBlack80,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                model.busin[index].urlToImage == null
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
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
                                      )
                                    : model.busin[index].urlToImage),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              model.busin[index].title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: getMediumStyle(fontSize: 19, color: text),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 1.0, top: 8.0),
                              child: Text(
                                model.busin[index].author == null
                                    ? 'No Author'
                                    : model.busin[index].author,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: getBoldStyle(
                                    fontSize: 12, color: textLight),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
