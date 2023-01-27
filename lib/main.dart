import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:player/screens/Singer.dart';
import 'package:player/screens/song_list.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Audio_playerPage(),
    ),
  );
}

class Audio_playerPage extends StatefulWidget {
  const Audio_playerPage({Key? key}) : super(key: key);

  @override
  State<Audio_playerPage> createState() => _Audio_playerPageState();
}

class _Audio_playerPageState extends State<Audio_playerPage> {
  final AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Audio player"),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.brown,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Song Library",
                  style: TextStyle(
                    color: Color(0xffA4BE7B),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Container(
                        height: 130,
                        width: 100,
                        child: const Image(
                          image: AssetImage("assets/images/music_icon.png"),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        children: const [
                          Text(
                            "Best Song",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Library",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Indian Bollywood",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
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
          SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Music(),
                    ),
                  );
                },
                child: const Text("Press"),
                backgroundColor: Colors.black,
              ),
              FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const song_List(),
                    ),
                  );
                },
                child: const Text("List"),
                backgroundColor: Colors.black,
              ),
            ],
          )
        ],
      ),
      backgroundColor: Colors.grey,
    );
  }
}
