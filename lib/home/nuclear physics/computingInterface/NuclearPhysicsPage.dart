// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuclearphysicssimple/design/colors.dart';
import 'package:nuclearphysicssimple/design/fontSize.dart';
import 'package:nuclearphysicssimple/home/nuclear%20physics/computingInterface/radioactivedecay/RadioactiveDecayPage.dart';
import 'package:nuclearphysicssimple/home/nuclear%20physics/computingInterface/specificbindingenergy/SpecificBidingEnergy.dart';

class NuclearPhysicsPage extends StatefulWidget {
  const NuclearPhysicsPage({Key? key}) : super(key: key);

  @override
  State<NuclearPhysicsPage> createState() => _NuclearPhysicsPageState();
}

class _NuclearPhysicsPageState extends State<NuclearPhysicsPage> {
  List calculations = [
    'Radioaktív bomlás',
    'Egyetlen nukleon átlagos energiája',
  ];

  List calculationScreens = [
    const RadioactiveDecayPage(),
    const SpecificBidingEnergy(),
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
                'Számítási felület:',
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
          itemCount: calculations.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => calculationScreens[index]));
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
                    calculations[index],
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
