import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuclearphysicssimple/design/colors.dart';
import 'package:nuclearphysicssimple/design/fontSize.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

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
                'Egyéb információ:',
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
          child: Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 2.5, horizontal: 10.0),
                decoration: BoxDecoration(
                  color: deepLightBlue,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Nuclear Physics Simple',
                              style: GoogleFonts.getFont('Dosis',
                                  textStyle: TextStyle(
                                      color: textSubtitle,
                                      fontSize: topicsTitle)),
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
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            35.0, 20.0, 20.0, 20.0),
                                        child: Icon(
                                          Icons.info,
                                          size: 20.0,
                                          color: textSubtitle,
                                        )),
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          20.0, 20.0, 35.0, 20.0),
                                      child: Text(
                                        '1.0.0',
                                        style: GoogleFonts.getFont('Dosis',
                                            textStyle: TextStyle(
                                                color: textSubtitle,
                                                fontSize: subtitle,
                                                fontStyle: FontStyle.italic)),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Nuclear Physics Simple',
                              style: GoogleFonts.getFont('Dosis',
                                  textStyle: TextStyle(
                                      color: textSubtitle,
                                      fontSize: topicsTitle)),
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
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            35.0, 20.0, 20.0, 20.0),
                                        child: Icon(
                                          Icons.info,
                                          size: 20.0,
                                          color: textSubtitle,
                                        )),
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          20.0, 20.0, 35.0, 20.0),
                                      child: Text(
                                        '1.0.0',
                                        style: GoogleFonts.getFont('Dosis',
                                            textStyle: TextStyle(
                                                color: textSubtitle,
                                                fontSize: subtitle,
                                                fontStyle: FontStyle.italic)),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
