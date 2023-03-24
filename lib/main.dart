import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuclearphysicssimple/design/colors.dart';
import 'package:nuclearphysicssimple/design/fontSize.dart';
import 'package:nuclearphysicssimple/home/HomePage.dart';
import 'package:nuclearphysicssimple/home/other/InfoPage.dart';

void main() {
  runApp(const PhysicsSimple());
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class PhysicsSimple extends StatefulWidget {
  const PhysicsSimple({Key? key}) : super(key: key);

  @override
  State<PhysicsSimple> createState() => _PhysicsSimpleState();
}

class _PhysicsSimpleState extends State<PhysicsSimple> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: iconBack),
          centerTitle: true,
          titleTextStyle: GoogleFonts.getFont("Dosis",
              textStyle: TextStyle(
                  color: textTitle,
                  fontSize: title,
                  fontWeight: FontWeight.bold)),
          color: deepPurple,
        ),
        textTheme: TextTheme(
          subtitle1: GoogleFonts.getFont('Dosis',
              textStyle: TextStyle(color: textInput, fontSize: inputField)),
        ),
      ),
      home: const HomePage(),
    );
  }
}
