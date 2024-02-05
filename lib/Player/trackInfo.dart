import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'audioPlayer.dart';

class TrackInfo extends StatelessWidget {
  String? trackName;
  String? trackDescription;
  String? trackTime;
  String? trackId;
  String? trackAuthor;
  String? trackImg;
  TrackInfo({
    super.key,
    this.trackName,
    this.trackDescription,
    this.trackTime,
    this.trackId,
    this.trackAuthor,
    this.trackImg,
  });

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 70,
            width: size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
              ),
              color: Color.fromARGB(255, 15, 147, 142),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 50,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('imges/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 35,
            ),
            Container(
              width: size.width / 2,
              height: 65,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('imges/luisterHeader2.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: size.height / 9,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color.fromARGB(255, 15, 184, 199),
              ),
              height: 400,
              width: size.width - 60,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                            ),
                            height: 150,
                            width: size.width / 2,
                            child: ImageNetwork(
                              image: trackImg!,
                              height: 130,
                              width: 120,
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            trackName!,
                            style: const TextStyle(
                              fontSize: 21,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  trackAuthor!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  ' - ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  trackTime!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ]),
                    AudioPlayerPage(
                      trackId: trackId,
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
