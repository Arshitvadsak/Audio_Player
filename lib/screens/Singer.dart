import 'package:flutter/material.dart';
import 'package:player/screens/Songs.dart';
import 'package:player/screens/globals.dart';

class Music extends StatefulWidget {
  const Music({Key? key}) : super(key: key);

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(" Best Singer"), backgroundColor: Colors.grey),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                  gradient: const LinearGradient(
                    colors: [
                      Colors.brown,
                      Colors.grey,
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    stops: [0.1, 0.8],
                    tileMode: TileMode.repeated,
                  ),
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
              const SizedBox(height: 10),
              Column(
                children: allSinger
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) =>  Songs(songTital: "",audio: ""),
                            //   ),
                            //);
                          },
                          child: Row(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height / 5,
                                width: MediaQuery.of(context).size.width / 1.6,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                 // color: Colors.brown[300],
                                   gradient: const LinearGradient(
                                     colors: [
                                       Colors.grey,
                                       Colors.brown,
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                    stops: [0.1, 0.8],
                                    tileMode: TileMode.repeated,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 100,
                                          width: 100,
                                          child: Image(
                                            image: AssetImage("${e['image']}"),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "${e['name']}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.brown[300],
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(width: 2),
                                ),
                                child:Center(
                                  child: Text(
                                    "${e['id']}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey,
    );
  }
}
