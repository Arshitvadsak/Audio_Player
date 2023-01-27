import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:player/screens/Songs.dart';
import 'globals.dart';

class song_List extends StatefulWidget {
  const song_List({Key? key}) : super(key: key);

  @override
  State<song_List> createState() => _song_ListState();
}

class _song_ListState extends State<song_List> {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List",
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: 290,
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 15,
                    spreadRadius: 5,
                    offset: Offset(
                      5.0, // Move to right 5  horizontally
                      5.0, // Move to bottom 5 Vertically
                    ),
                  )
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: const Image(
                          image: AssetImage(
                            "assets/images/music_icon.png",
                          ),
                          height: 240,
                          width: 240,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "Dhvani Bhanushali",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20 ),
              child: Column(
                children: Globals.Song_list.map(
                  (e) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Songs(songTital: e['title'] ,audio:e['Audio'],),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        height: 65,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.brown[200],
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 5,
                              spreadRadius: 2,
                              offset: Offset(
                                3.0, // Move to right 5  horizontally
                                3.0, // Move to bottom 5 Vertically
                              ),
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 55,
                              width: 55,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: const Image(
                                  image: AssetImage(
                                    "assets/images/music_icon.png",
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "${e['title']}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "${e['artist']}",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.more_vert),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
