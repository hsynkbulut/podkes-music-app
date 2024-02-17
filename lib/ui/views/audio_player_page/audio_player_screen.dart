// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:hk_music/common/constants/colors.dart';
import 'package:hk_music/common/helpers/helpers_functions.dart';
import '../../widgets/audio_appbar.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({
    Key? key,
    required this.musicData,
    required this.image,
  }) : super(key: key);

  final String musicData;
  final String image;

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  bool isPlaying = false;
  double value = 0;
  final player = AudioPlayer();
  Duration? duration;

  void initPlayer() async {
    await player.setSource(AssetSource(widget.musicData));
    duration = await player.getDuration();
  }

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  @override
  Widget build(BuildContext context) {
    final height = THelperFunctions.screenHeight(context);
    final width = THelperFunctions.screenWidth(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.primaryColor,
      appBar: const AudioAppBar(
        showBackButton: true,
        title: 'Now Playing',
      ),
      body: Padding(
        //padding: const EdgeInsets.only(left: 30, right: 30, top: 40, bottom: 5),
        padding: EdgeInsets.only(
          left: width * 0.07,
          right: width * 0.07,
          top: height * 0.08,
          bottom: height * 0.01,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //setting the music cover
            Container(
              width: width * 0.9, //350,
              height: height * 0.4, //350,
              //color: AppColors.textPrimary,
              child: Image.asset(
                widget.image,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: height * 0.02),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "The missing 96 percent of the universe",
                  style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: height * 0.015),
                Text(
                  "Claire Malone",
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 16,
                  ),
                ),
              ],
            ),

            //Setting the seekbar
            SizedBox(height: height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${(value / 60).floor()}: ${(value % 60).floor()}",
                  style: const TextStyle(color: Colors.white),
                ),
                Container(
                  width: width * 0.65,
                  child: Slider.adaptive(
                    onChangeEnd: (newValue) async {
                      setState(() {
                        value = newValue;
                        print(newValue);
                      });
                      await player.seek(Duration(seconds: newValue.toInt()));
                    },
                    min: 0.0,
                    value: value,
                    max: 214.0,
                    onChanged: (value) {},
                    activeColor: Colors.white,
                  ),
                ),
                Text(
                  "${duration != null ? duration!.inMinutes : ''} : ${duration != null ? duration!.inSeconds % 60 : ''}",
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            //setting the player controller
            SizedBox(height: height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60.0),
                    //color: Colors.black87,
                    //border: Border.all(color: Colors.white38),
                  ),
                  width: 50.0,
                  height: 50.0,
                  child: InkWell(
                    onTapDown: (details) {
                      player.setPlaybackRate(0.5);
                    },
                    onTapUp: (details) {
                      player.setPlaybackRate(1);
                    },
                    child: const Center(
                      child: Icon(
                        Icons.skip_previous_rounded, //BİR ÖNCEKİ MÜZİK TUŞU
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60.0),
                    color: AppColors.buttonColor,
                  ),
                  width: 60.0,
                  height: 60.0,
                  child: InkWell(
                    onTap: () async {
                      if (isPlaying) {
                        await player.pause(); // Müziği duraklat
                      } else {
                        await player.resume(); // Müziği oynat
                        player.onPositionChanged.listen((Duration d) {
                          setState(() {
                            value = d.inSeconds.toDouble();
                            print(value);
                          });
                        });
                      }
                      setState(() {
                        isPlaying = !isPlaying; // Durum değişimi
                      });
                    },
                    child: Center(
                      child: Icon(
                        isPlaying
                            ? Icons.pause
                            : Icons.play_arrow, // Duruma göre simge değişimi
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60.0),
                    //color: Colors.black87,
                    //border: Border.all(color: Colors.white38),
                  ),
                  width: 50.0,
                  height: 50.0,
                  child: InkWell(
                    onTapDown: (details) {
                      player.setPlaybackRate(2);
                    },
                    onTapUp: (details) {
                      player.setPlaybackRate(1);
                    },
                    child: const Center(
                      child: Icon(
                        Icons.skip_next_rounded, //BİR SONRAKİ MÜZİK TUŞU
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
