import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuclearphysicssimple/design/colors.dart';
import 'package:nuclearphysicssimple/design/fontSize.dart';
import 'package:nuclearphysicssimple/home/nuclear%20physics/educationalMaterial/MaterialAudioPage.dart';

class MaterialHomePage extends StatefulWidget {
  const MaterialHomePage({super.key});

  @override
  State<MaterialHomePage> createState() => _MaterialHomePageState();
}

class _MaterialHomePageState extends State<MaterialHomePage> {
  List lesson = [
    'Bevezető',
    'Radioaktív bomlás',
    'Egyetlen nukleon átlagos energiája',
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
                'Tananyag:',
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
          itemCount: lesson.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MaterialAudioPage(
                              index: index,
                            )));
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
                    lesson[index],
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
