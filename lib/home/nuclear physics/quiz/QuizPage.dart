import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuclearphysicssimple/design/colors.dart';
import 'package:nuclearphysicssimple/design/fontSize.dart';
import 'package:nuclearphysicssimple/home/nuclear%20physics/quiz/QuizResaultPage.dart';
import 'package:nuclearphysicssimple/home/nuclear%20physics/quiz/model.dart';

class QuizPage extends StatefulWidget {
  final int index;

  const QuizPage({super.key, required this.index});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List lesson = [
    'Bevezető',
    'Radioaktív bomlás',
    'Egyetlen nukleon átlagos energiája',
  ];

  int questionNumber = 0;
  int score = 0;

  late PageController controller;

  String level = '';

  void _resetQuiz() {
    setState(() {
      questionNumber = 0;
      score = 0;
      level = '';
    });
  }

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
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
              '${lesson[widget.index]}:',
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
          child: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            child: questionNumber < questions[widget.index].length
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Container(
                          height: 550.0,
                          width: MediaQuery.of(context).size.width,
                          child: PageView.builder(
                              itemCount: questions[widget.index].length,
                              controller: controller,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final question = questions[widget.index][index];
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        question.text,
                                        style: GoogleFonts.dosis(
                                            textStyle: TextStyle(
                                                color: errorText,
                                                fontSize: topicsTitle)),
                                      ),
                                    ),
                                    Expanded(
                                        child: OptionsWidget(
                                      question: question,
                                      onClickedOption: (option) {
                                        setState(() {
                                          question.selectedOption = option;
                                        });
                                        if (question
                                            .selectedOption!.isCorrect) {
                                          score++;
                                        }
                                        if (questionNumber <
                                            questions[widget.index].length) {
                                          controller.nextPage(
                                              duration: const Duration(
                                                  milliseconds: 500),
                                              curve: Curves.easeInExpo);
                                          setState(() {
                                            questionNumber++;
                                            if (score / questionNumber < 0.24) {
                                              level =
                                                  'Szörnyű!\nGyakorolj még!';
                                            }
                                            if (score / questionNumber > 0.25 &&
                                                score / questionNumber < 0.39) {
                                              level =
                                                  'Elégséges eredmény!\nCsak egy-két választ tudtál.';
                                            }
                                            if (score / questionNumber > 0.40 &&
                                                score / questionNumber < 0.59) {
                                              level =
                                                  'Elfogadható eredmény!\nCsak a lecke felét tudod.';
                                            }
                                            if (score / questionNumber > 0.60 &&
                                                score / questionNumber < 0.79) {
                                              level =
                                                  'Szép eredmény!\nVolt néhány hibád, de még jó.';
                                            }
                                            if (score / questionNumber > 0.80 &&
                                                score / questionNumber < 0.99) {
                                              level =
                                                  'Bravó!\nCsak egy-két hibád volt.';
                                            }
                                            if (score == questionNumber) {
                                              level =
                                                  'Gratulálok!\nTökéletesen tudod a leckét.';
                                            }
                                          });
                                        }
                                      },
                                    ))
                                  ],
                                );
                              }),
                        ),
                        SizedBox(
                          height: 20.0,
                        )
                      ],
                    ),
                  )
                : QuizResaultPage(
                    widget.index, score, questionNumber, _resetQuiz, level)),
      ))
    ]));
  }
}

class OptionsWidget extends StatelessWidget {
  final Question question;
  final ValueChanged<Option> onClickedOption;

  const OptionsWidget(
      {super.key, required this.question, required this.onClickedOption});

  @override
  Widget build(BuildContext context) => Column(
      children: question.options
          .map((option) => GestureDetector(
                onTap: () => onClickedOption(option),
                child: Container(
                  height: 65.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                      color: deepLightBlue,
                      borderRadius: BorderRadius.circular(16.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        option.text,
                        style: GoogleFonts.dosis(
                            textStyle: TextStyle(
                                color: textSubtitle, fontSize: topicsTitle)),
                      ),
                    ],
                  ),
                ),
              ))
          .toList());
}
