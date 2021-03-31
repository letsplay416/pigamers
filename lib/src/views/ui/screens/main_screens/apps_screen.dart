import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
              backgroundColor: kPrimaryColor.withOpacity(0.2),
              stretch: true,
              centerTitle: true,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Applications & Jeux",
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headline5),
                stretchModes: [
                  StretchMode.zoomBackground,
                  StretchMode.fadeTitle,
                ],
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      "lib/src/assets/images/trioPic.jpeg",
                      fit: BoxFit.cover,
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.0, 0.5),
                          colors: [
                            kPrimaryColor.withOpacity(0.3),
                            Color(0x00000000)
                          ],
                          end: Alignment(0.0, 0.0),
                        ),
                      ),
                    )
                  ],
                ),
                centerTitle: true,
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Column(
                children: [
                  Container(
                    height: Get.size.height * 0.85,
                    child: FutureBuilder<QuerySnapshot>(
                      future: apps.get(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text('Something went wrong');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                              height: snapshot.data!.docs[index]["isGame"]
                                  ? 300
                                  : 250,
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
                ],
              )
            ]))
          ],
        ),
        /*  body: Column(
          children: [
            Container(
              height: Get.size.height * 0.15,
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Applications & Jeux,",
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.headline5),
                      SizedBox(
                        height: kDefaultPadding / 3,
                      ),
                      Text(
                        "Good day for gaming!",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 60,
                      child: SvgPicture.asset(
                          "lib/src/assets/svg/undraw_Mobile_life_re_jtih.svg"),
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            FutureBuilder<QuerySnapshot>(
              future: apps.get(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }

                return Expanded(
                  child: StaggeredGridView.countBuilder(
                    itemCount: snapshot.data!.docs.length,
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    padding: EdgeInsets.all(15),
                    itemBuilder: (context, index) => Container(
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
                      height: snapshot.data!.docs[index]["isGame"] ? 300 : 250,
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
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                  ),
                );
              },
            )
          ],
        ),*/
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            apps
                .add({
                  'title': "Fortnite",
                  'imgUrl':
                      "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.epicgames.com%2Ffortnite%2Ffr%2Fnews%2Fday-1-ready-fortnite-arrives-next-week-on-xbox-series-x-s-and-ps5&psig=AOvVaw1keWKTACFT2L2-BmiNxP82&ust=1617200093326000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNifx5H_1-8CFQAAAAAdAAAAABAD",
                  "link":
                      "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.epicgames.com%2Ffortnite%2Ffr%2Fnews%2Fday-1-ready-fortnite-arrives-next-week-on-xbox-series-x-s-and-ps5&psig=AOvVaw1keWKTACFT2L2-BmiNxP82&ust=1617200093326000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNifx5H_1-8CFQAAAAAdAAAAABAD",
                  "desc": "un bon jeu",
                  'isGame': true,
                })
                .then((value) => print("User Added"))
                .catchError((error) => print("Failed to add user: $error"));
          },
        ),
      ),
    );
  }
}
