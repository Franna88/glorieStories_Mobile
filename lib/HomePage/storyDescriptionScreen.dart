import 'package:flutter/material.dart';
import 'package:glorie_stories_mobile/HomePage/home.dart';
import 'package:glorie_stories_mobile/Player/trackInfo.dart';

import 'package:image_network/image_network.dart';

class StoryDescription extends StatefulWidget {
  String? trackName;
  String? trackDescription;
  String? trackTime;
  String? trackId;
  String? trackAuthor;
  String? trackImg;
  StoryDescription({
    super.key,
    this.trackName,
    this.trackDescription,
    this.trackTime,
    this.trackId,
    this.trackAuthor,
    this.trackImg,
  });

  @override
  State<StoryDescription> createState() => _StoryDescriptionState();
}

class _StoryDescriptionState extends State<StoryDescription> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: size.width,
            height: size.height / 3,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 130, 230, 235),
              borderRadius: new BorderRadius.only(
                bottomRight: const Radius.circular(30.0),
                bottomLeft: const Radius.circular(30.0),
              ),
            ),
            child: Column(
              children: [
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 34,
                        ),
                      ),
                    ]),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color.fromARGB(255, 130, 230, 235),
                      ),
                      height: 150,
                      width: size.width / 2,
                      child: ImageNetwork(
                        image: widget.trackImg!,
                        height: 130,
                        width: 120,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Text(
            widget.trackAuthor!,
            style: TextStyle(
                color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.trackTime!,
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w200),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.trackDescription!,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Spacer(),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TrackInfo(
                      trackName: widget.trackName,
                      trackDescription:
                          widget.trackDescription! ?? 'No description',
                      trackTime: widget.trackTime! ?? 'No timeframe',
                      trackImg: widget.trackImg!,
                      trackId: widget.trackId!,
                      trackAuthor: widget.trackAuthor,
                    ),
                  )); /**/
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFF19898D),
              ),
              width: size.width - 50,
              height: 50,
              child: const Center(
                child: Text(
                  'Speel Nou',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
