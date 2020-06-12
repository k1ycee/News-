import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:povider/model/hng_model.dart';
import 'package:povider/utils/colors.dart';

class TopNewsWidget extends StatelessWidget {
  final Article article;
  final int index;
  final int size;

  const TopNewsWidget(this.article, this.index, this.size);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: index == 0
          ? const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 20.0,
              right: 15.0,
            )
          : index == size
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
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WebviewScaffold(
                  url: article.url,
                  appBar: AppBar(
                    leading: IconButton(
                      icon: Icon(Icons.keyboard_backspace),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    centerTitle: true,
                    title: Text(article.title),
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
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 0.82,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: NetworkImage(article.urlToImage), fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(colors: [
                    transBlack20,
                    transBlack40,
                    transBlack60,
                    transBlack80,
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
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
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      article.title,
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
                      article.author,
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
    );
  }
}
