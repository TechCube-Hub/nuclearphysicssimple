import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuclearphysicssimple/design/colors.dart';
import 'package:nuclearphysicssimple/design/fontSize.dart';
import 'package:nuclearphysicssimple/home/nuclear%20physics/NuclearHomePage.dart';
import 'package:nuclearphysicssimple/home/nuclear%20physics/computingInterface/NuclearPhysicsPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List topics = ['Magfizika'];

  List topicsScreens = [
    const NuclearHomePage(),
  ];

  List calculations = [
    'Radioaktív bomlás,\nEgyetlen nukleon átlagos energiája,\n...',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text('Nuclear Physics Simple'),
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
                'Témakörök:',
                style: GoogleFonts.getFont('Dosis',
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
            itemCount: topics.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => topicsScreens[index]));
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 2.5, horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: deepLightBlue,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          topics[index],
                          style: GoogleFonts.getFont('Dosis',
                              textStyle: TextStyle(
                                  color: textSubtitle, fontSize: topicsTitle)),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: deepBlue,
                          shape: BoxShape.rectangle,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(48.0),
                            bottomRight: Radius.circular(16.0),
                            bottomLeft: Radius.circular(16.0),
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(24.0),
                          child: Text(
                            calculations[index],
                            style: GoogleFonts.getFont('Dosis',
                                textStyle: TextStyle(
                                    color: textSubtitle,
                                    fontSize: description,
                                    fontStyle: FontStyle.italic)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    ));
  }
}
