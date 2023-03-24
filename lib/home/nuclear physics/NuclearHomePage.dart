import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuclearphysicssimple/design/colors.dart';
import 'package:nuclearphysicssimple/design/fontSize.dart';
import 'package:nuclearphysicssimple/home/nuclear%20physics/computingInterface/NuclearPhysicsPage.dart';
import 'package:nuclearphysicssimple/home/nuclear%20physics/educationalMaterial/MaterialHomePage.dart';
import 'package:nuclearphysicssimple/home/nuclear%20physics/quiz/QuizHomePage.dart';

class NuclearHomePage extends StatefulWidget {
  const NuclearHomePage({super.key});

  @override
  State<NuclearHomePage> createState() => _NuclearHomePageState();
}

class _NuclearHomePageState extends State<NuclearHomePage> {
  List pages = ['Tananyag', 'Kvíz', 'Számítási felület'];

  List pagesScreen = [
    const MaterialHomePage(),
    const QuizHomePage(),
    const NuclearPhysicsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text('Nuclear Physics Simple'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.of(context).pop(),
          ),
          expandedHeight: 125.0,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.zero,
            title: Container(
              height: 49.0,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomLeft,
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.5),
              child: Text(
                'Magfizika:',
                style: GoogleFonts.dosis(
                    textStyle: TextStyle(
                        color: textTitle,
                        fontSize: subtitle,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
            child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: pages.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => pagesScreen[index]));
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  color: deepLightBlue,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    pages[index],
                    style: GoogleFonts.dosis(
                        textStyle: TextStyle(
                            color: textSubtitle, fontSize: topicsTitle)),
                  ),
                ),
              ),
            );
          },
        ))
      ],
    ));
  }
}
