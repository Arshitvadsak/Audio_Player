import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class Songs extends StatefulWidget {
  const Songs({Key? key,required this.songTital,required this.audio}) : super(key: key);

  final String songTital;
  final String audio;

  @override
  State<Songs> createState() => _SongsState();
}

class _SongsState extends State<Songs> {
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();


  @override
  void initState() {
    assetsAudioPlayer.open(
      Playlist(
        audios: [
          Audio(widget.audio,
            metas: Metas(
              title:  widget.songTital,
              artist: "All Singer",
              album: "CountryAlbum",
              image: const MetasImage.asset(
                "assets/images/king.jpeg",
              ), //can be MetasImage.network
            ),
          ),
        ],
      ),
      loopMode: LoopMode.playlist,
      showNotification: true,
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Column(
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                          "Music",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
               Column(
                 children: [
                   Text(
                   widget.songTital,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
              ),
                  const Text("T-series"),
                 ],
               ),

              const SizedBox(height: 20),
              Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value) {},
                activeColor: Colors.grey,
                inactiveColor: Colors.black,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('0:00'),
                    Text('5:00'),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.skip_previous,size: 40,),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 35,
                    child:
                    IconButton(
                      icon: const Icon(
                        Icons.play_arrow,
                      ),
                      iconSize: 50,
                      onPressed: () {

                          assetsAudioPlayer.stop();
                        },
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.skip_next,size: 40,),
                  ),
                ],
              ), const SizedBox(height: 40),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu,size: 20,),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.refresh,size: 20,),
                  ),IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.heart_broken_sharp,size: 20,),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
