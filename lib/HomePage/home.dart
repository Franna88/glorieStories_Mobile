import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:glorie_stories_mobile/HomePage/storyDescriptionScreen.dart';
import 'package:image_network/image_network.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 70,
            width: size.width / 2,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
              ),
              color: Color.fromARGB(255, 15, 147, 142),
            ),
            child: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Neem Kennis'),
                      content: Text('Hierdie funksie kom binnekort'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.home,
                color: Colors.white,
                size: 50,
              ),
            ),
          ),
          Container(
            height: 70,
            width: size.width / 2,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
              ),
              color: Color.fromARGB(255, 15, 147, 142),
            ),
            child: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Neem Kennis'),
                      content: Text('Hierdie funksie kom binnekort'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.favorite,
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
            image: AssetImage('imges/StoriesScreen.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            margin: const EdgeInsets.only(top: 150),
            child: const TrackBuilder(),
          ),
        ),
      ),
    );
  }
}

class TrackBuilder extends StatelessWidget {
  const TrackBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('stories').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot stories = snapshot.data!.docs[index];
                return SizedBox(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(122, 49, 194, 224),
                      ),
                      height: 80,
                      width: size.width - 200,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StoryDescription(
                                  // id: stories['trackId'] ?? '',
                                  trackName: stories['title'] ?? 'No title',
                                  trackDescription: stories['description'] ??
                                      'No description',
                                  trackTime:
                                      stories['timeframe'] ?? 'No timeframe',
                                  trackImg: stories['imageUrl'],
                                  trackId: stories.id,
                                  trackAuthor: stories['author'],
                                ),
                              ),
                            );
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(75),
                                    color: Colors.white,
                                  ),
                                  height: 70,
                                  width: 70,
                                  child: ImageNetwork(
                                    image: stories['imageUrl'],
                                    height: 70,
                                    width: 70,
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              SizedBox(
                                width: size.width - 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 1),
                                    Text(
                                      stories['title'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          stories['author'],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          ' - ',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          stories['timeframe'],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              });
        });
  }
}
