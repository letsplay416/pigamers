import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pigamers/src/views/ui/widgets/ads_widget.dart';
import 'package:pigamers/src/views/ui/widgets/apps_widget.dart';
import 'package:pigamers/src/views/ui/widgets/news_widget.dart';

class MoreNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('piNews').get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Container();
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(
            color: Theme.of(context).accentColor,
          );
        }
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Pi'News",
              style: GoogleFonts.akronim(),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: snapshot.data!.docs.length,
              // padding: const EdgeInsets.all(10),
              itemBuilder: (BuildContext context, int index) {
                final String type = snapshot.data!.docs[index]["type"];
                final String imgUrl = snapshot.data!.docs[index]["imgUrl"];
                if (type == "ADS") {
                  return AdsWidget(imgUrl: imgUrl);
                } else if (type == "NEWS") {
                  return NewsWidget(imgUrl: imgUrl);
                } else {
                  return AppsWidget(imgUrl: imgUrl);
                }
              },
              staggeredTileBuilder: (int index) =>
                  new StaggeredTile.count(2, index.isEven ? 3 : 2),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          ),
        );
      },
    );
  }
}
