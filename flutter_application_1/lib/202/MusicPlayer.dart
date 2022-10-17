/*
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



class MusicPlayer extends StatefulWidget {
  const MusicPlayer({Key? key}) : super(key: key);

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

final auidoPlayer = AudioPlayer();
bool isPlaying = false;
Duration duration = Duration.zero;
Duration position = Duration.zero;

class _MusicPlayerState extends State<MusicPlayer>
    with TickerProviderStateMixin {
  /*final auidoPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;*/

  @override
  void initState() {
    super.initState();
    setAudio();

    auidoPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });
    auidoPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    auidoPlayer.onPlayerStateChanged.listen((newPosition) {
      setState(() {
        position = newPosition as Duration;
      });
    });
  }

  Future setAudio() async {
    auidoPlayer.setReleaseMode(ReleaseMode.LOOP);
    String url =
        'https://open.spotify.com/track/03sf6gnuqZNE9sGrRi8WAc?si=81d58dfc68434d78';
    auidoPlayer.setUrl(url);
  }

  @override
  void dispose() {
    auidoPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                'https://open.spotify.com/track/03sf6gnuqZNE9sGrRi8WAc?si=81d58dfc68434d78',
                width: double.infinity,
                height: 350,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Çakıl Taşları',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text('Şebnem Ferah', style: TextStyle(fontSize: 20)),
            Slider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (value) async {
                final position = Duration(seconds: value.toInt());
                await auidoPlayer.seek(position);
                await auidoPlayer.resume();
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Text(formatTime(position)),
                  // Text(formatTime (duration-position)),
                ],
              ),
            ),
            CircleAvatar(
              radius: 35,
              child: IconButton(
                onPressed: () async {
                  if (isPlaying) {
                    await auidoPlayer.pause();
                  } else {
                    await auidoPlayer.resume();

                    /*String url='https://open.spotify.com/track/03sf6gnuqZNE9sGrRi8WAc?si=81d58dfc68434d78';
                  await auidoPlayer.play(url);*/
                  }
                },
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                iconSize: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
