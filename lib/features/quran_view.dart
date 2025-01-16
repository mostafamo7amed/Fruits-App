
import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_manager/app_styles.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({super.key});

  @override
  QuranPageState createState() => QuranPageState();
}

class QuranPageState extends State<QuranPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  int? _playingAyahIndex;

  // Dummy list of Ayahs and their corresponding audio URLs
  final List<Map<String, String>> _ayahs = [
    {"text": "بِسْمِ اللَّهِ الرَّحْمٍَ", "audio": 'https://quranaudio.pages.dev/2/1_1.mp3'},
    {"text": "ٱلْحَمْدُ لِلَّهِ رَبِّ ٱلْعَـٰلَمِينَ", "audio": 'https://quranaudio.pages.dev/2/1_2.mp3'},
    {"text": "الرَّحْمَٰنِ الرَّحِيمَ", "audio": 'https://quranaudio.pages.dev/2/1_3.mp3'},
    {"text": "مَٰلِكِ يَوۡمِ ٱلدِّينَِ", "audio": 'https://quranaudio.pages.dev/2/1_4.mp3'},
    {"text": "إِيَّاكَ نَعۡبُدُ وَإِيَّاكَ نَسۡتَعِينُ", "audio": 'https://quranaudio.pages.dev/2/1_5.mp3'},
    {"text": "ٱهۡدِنَا ٱلصِّرَٰطَ ٱلۡمُسۡتَقِيمََ", "audio": 'https://quranaudio.pages.dev/2/1_6.mp3'},
    {"text": "صِرَٰطَ ٱلَّذِينَ أَنۡعَمۡتَ عَلَيۡهِمۡ غَيۡرِ ٱلۡمَغۡضُوبِ عَلَيۡهِمۡ وَلَا ٱلضَّآلِّينََ", "audio": 'https://quranaudio.pages.dev/2/1_7.mp3'}
  ];

  void _playAudio(int index) async {
    final audioUrl = _ayahs[index]["audio"]!;
    await _audioPlayer.stop();
    log(audioUrl.toString());
    Source source = UrlSource(audioUrl.toString()); // Stop any currently playing audio
    await _audioPlayer.play(source); // Play the selected Ayah's audio
    setState(() {
      _playingAyahIndex = index;
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Surah Example"),
      ),
      body:  SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0; i < _ayahs.length; i++) ...[
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _playAudio(i),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              color: _playingAyahIndex == i
                                  ? Colors.blueAccent.withValues(alpha: 0.1)
                                  : Colors.transparent,
                              child: Text(
                                '${_ayahs[i]["text"]!} ${i + 1}',
                                textAlign: TextAlign.justify,
                                style: Styles.regular16.copyWith(fontFamily: "nunito",),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
