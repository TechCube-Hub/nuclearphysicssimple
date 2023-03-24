import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuclearphysicssimple/design/colors.dart';
import 'package:nuclearphysicssimple/design/fontSize.dart';

class MaterialAudioPage extends StatefulWidget {
  final int index;

  const MaterialAudioPage({super.key, required this.index});

  @override
  State<MaterialAudioPage> createState() => _MaterialAudioPageState();
}

class _MaterialAudioPageState extends State<MaterialAudioPage> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    setAudio();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.stop);

    final player = AudioCache(prefix: 'audio/');
    final url = await player.load(audios[widget.index]);
    audioPlayer.setSourceUrl(url.path);
  }

  @override
  void dispose() {
    audioPlayer.dispose();

    super.dispose();
  }

  List lesson = [
    'Bevezető',
    'Radioaktív bomlás',
    'Egyetlen nukleon átlagos energiája',
  ];

  List lessonDescription = [
    'Bevezető\n \n#Atom\n#Atommag\n#Izotópok',
    'Radioaktív bomlás\n \n#Sugárzások\n#AlfaBétaGamma\n#Bomlásisorok',
    'Egyetlen nukleon átlagos energiája\n \n#Tömegdefektus\n#Kötésienergia\n#Cseppmodell',
  ];

  List audios = ['audio1.m4a', 'audio2.m4a', 'audio3.m4a'];

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 280.0,
                  width: 280.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 15.0),
                  decoration: BoxDecoration(
                      color: deepLightBlue,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(top: 15.0, left: 15.0),
                          child: Text(lessonDescription[widget.index],
                              style: GoogleFonts.getFont('Dosis',
                                  textStyle: TextStyle(
                                      color: textAtom, fontSize: title))),
                        ),
                      ),
                    ],
                  ),
                ),
                Slider(
                    min: 0,
                    max: duration.inSeconds.toDouble(),
                    value: position.inSeconds.toDouble(),
                    thumbColor: deepBlue,
                    activeColor: deepBlue,
                    inactiveColor: deepLightBlue,
                    onChanged: ((value) async {
                      final position = Duration(seconds: value.toInt());
                      await audioPlayer.seek(position);

                      await audioPlayer.resume();
                    })),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(formatTime(position)),
                      Text(formatTime(duration)),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 35,
                  backgroundColor: deepPurple,
                  child: IconButton(
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    iconSize: 50,
                    color: iconSend,
                    onPressed: () async {
                      if (isPlaying) {
                        await audioPlayer.pause();
                      } else {
                        await audioPlayer.resume();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
