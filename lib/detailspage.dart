import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share/share.dart';

// class Alligator {
//   String name;
//   String description;
//   String photo;

//   Alligator(
//       {@required this.name, @required this.description, @required this.photo});
// }

class DetailsPage extends StatefulWidget {
  String title, image, content;

  DetailsPage({
    this.title,
    this.image,
    this.content,
  });

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  StreamSubscription<QuerySnapshot> subscription;

  List<DocumentSnapshot> snapshot;

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("mints");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Mint Description"),
          backgroundColor: Colors.teal[200],
        ),
        endDrawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  'Options',
                  style: TextStyle(fontStyle: FontStyle.normal, fontSize: 50),
                ),
                decoration: BoxDecoration(
                  //color: Colors.blue,
                  color: Colors.teal[200],
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 10),
                //tileColor: Colors.teal,
                title: Text(
                  'Share Mint',
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 25,
                  ),
                ),
                onTap: () {
                  Share.share('Hey..!\n \nDo check this mint on \n https://play.google.com/store/apps/details?id=com.mints');
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  //Navigator.pop(context);
                },
              ),
              // ListTile(
              //   title: Text('Item 2'),
              //   onTap: () {
              //     // Update the state of the app
              //     // ...
              //     // Then close the drawer
              //     Navigator.pop(context);
              //   },
              // ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: <Widget>[
              Image.network(
                widget.image,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 350.0, 0.0, 0.0),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Material(
                    borderRadius: BorderRadius.circular(35.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                          child: Text(
                            widget.title,
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            widget.content,
                            style: TextStyle(
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
