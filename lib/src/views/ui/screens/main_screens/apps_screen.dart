import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pigamers/src/views/ui/screens/app_detail_screen.dart';
import 'package:pigamers/src/views/utils/constants.dart';

class AppsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference apps = FirebaseFirestore.instance.collection('apps');
    return SafeArea(
      child: Scaffold(
        backgroundColor: kContentColorLightTheme,
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              expandedHeight: Get.size.height * 0.3,
              title: Text(
                "Applications & Jeux",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline5,
              ),
              backgroundColor: kContentColorLightTheme,
              stretch: true,
              centerTitle: true,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: [
                  StretchMode.zoomBackground,
                  StretchMode.fadeTitle,
                ],
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                      child: Image.asset(
                        "lib/src/assets/images/trioPic.jpeg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    DecoratedBox(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: kSecondaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40))),
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.0, 1),
                          colors: [
                            Color(0x00000000),
                            kPrimaryColor.withOpacity(0.05),
                          ],
                          end: Alignment(0.0, 0.0),
                        ),
                      ),
                    ),
                  ],
                ),
                centerTitle: true,
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                height: Get.size.height * 0.85,
                child: FutureBuilder<QuerySnapshot>(
                  future: apps.get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }

                    return StaggeredGridView.countBuilder(
                      itemCount: snapshot.data!.docs.length,
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      padding: EdgeInsets.all(15),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () => Get.to(
                          AppDetail(
                            imagUrl: snapshot.data!.docs[index]["imgUrl"],
                            desc: snapshot.data!.docs[index]["desc"],
                            title: snapshot.data!.docs[index]["title"],
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(2, 2),
                                blurRadius: 4,
                                color: kThirdColor,
                              ),
                            ],
                            color: kFourthColor.withOpacity(0.2),
                            image: DecorationImage(
                              image: NetworkImage(
                                  snapshot.data!.docs[index]["imgUrl"]),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height:
                              snapshot.data!.docs[index]["isGame"] ? 300 : 250,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data!.docs[index]["title"],
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6, // TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Container(
                                // width: 19,
                                height: 20,
                                child: Text(
                                  snapshot.data!.docs[index]["desc"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: kThirdColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                    );
                  },
                ),
              )
            ]))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.transparent,
          child: SvgPicture.asset(
            "lib/src/assets/logo/pig1.svg",
            fit: BoxFit.contain,
          ),
          onPressed: () {
            apps
                .add({
                  'title': "Crunchyroll",
                  'imgUrl':
                      "https://play-lh.googleusercontent.com/CjzbMcLbmTswzCGauGQExkFsSHvwjKEeWLbVVJx0B-J9G6OQ-UCl2eOuGBfaIozFqow=s180",
                  "link":
                      "https://play.google.com/store/apps/details?id=droom.sleepIfUCan&hl=fr&gl=US",
                  "desc":
                      "Profitez de la plus grande collection d'anime au monde. Regardez plus de 600 séries, des précédentes saisons aux nouveaux épisodes tout juste arrivés du Japon, sans oublier les Crunchyroll Originals. Regardez des anime comme One Piece, Dr. STONE, Black Clover, JoJo's Bizarre Adventure, Food Wars!, The God of High School, Tower of God, Re:ZERO -Starting Life in Another World- et des centaines d'autres ! Que vous soyez nouveau dans le monde des anime ou que vous soyez fan depuis des décennies, Crunchyroll a quelque chose que vous allez adorer.",
                  'isGame': false,
                })
                .then((value) => print("User Added"))
                .catchError((error) => print("Failed to add user: $error"));
          },
        ),
      ),
    );
  }
}
