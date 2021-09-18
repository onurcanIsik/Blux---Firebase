// ignore_for_file: file_names, avoid_print, avoid_function_literals_in_foreach_calls, avoid_unnecessary_containers
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:op_scope/colors.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final fireStore = FirebaseFirestore.instance.collection("Chats");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Blux Chat",
            style: GoogleFonts.permanentMarker(fontSize: 25),
          ),
          backgroundColor: appBarColor,
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Chats").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return ListView(
              children: snapshot.data!.docs
                  .map((doc) => ListTile(
                        title: Text(doc["name"]),
                        subtitle: Text(
                          doc["message"],
                        ),
                      ))
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
