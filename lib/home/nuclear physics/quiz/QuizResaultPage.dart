import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nuclearphysicssimple/design/colors.dart';
import 'package:nuclearphysicssimple/design/fontSize.dart';

class QuizResaultPage extends StatefulWidget {
  final int index;
  final int score;
  final int questionNumber;
  final String level;

  final VoidCallback resetHandler;

  const QuizResaultPage(this.index, this.score, this.questionNumber,
      this.resetHandler, this.level);

  @override
  State<QuizResaultPage> createState() => _QuizResaultPageState();
}

class _QuizResaultPageState extends State<QuizResaultPage> {
  @override
  Widget build(BuildContext context) {
    var numberForm = NumberFormat("##0");

    return Column(
      children: [
        Container(
          height: 280.0,
          width: 280.0,
          margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          decoration: BoxDecoration(
              color: deepLightBlue,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8.0)),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.topCenter,
                  margin:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                  child: Text('Eredmény',
                      style: GoogleFonts.getFont('Dosis',
                          textStyle:
                              TextStyle(color: textAtom, fontSize: title))),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  margin:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                  child: Text(widget.level,
                      style: GoogleFonts.getFont('Dosis',
                          textStyle:
                              TextStyle(color: textAtom, fontSize: title))),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  margin:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('${widget.score} / ${widget.questionNumber}',
                          style: GoogleFonts.getFont('Dosis',
                              textStyle:
                                  TextStyle(color: textAtom, fontSize: title))),
                      Text(
                          '${numberForm.format(widget.score / widget.questionNumber * 100)} %',
                          style: GoogleFonts.getFont('Dosis',
                              textStyle:
                                  TextStyle(color: textAtom, fontSize: title))),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: deepPurple,
              onPrimary: iconSend,
            ),
            onPressed: widget.resetHandler,
            child: Text('Újra kitöltés')),
      ],
    );
  }
}
