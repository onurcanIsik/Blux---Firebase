// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:op_scope/Services/auth.dart';
import 'package:op_scope/Views/Chatpage.dart';
import 'package:op_scope/Widgets/mainWidget.dart';
import 'package:op_scope/colors.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: SizedBox(
          height: 60,
          child: BottomAppBar(
            color: appBarColor,
            elevation: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.report,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.home,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: Text(
            "Blux",
            style: GoogleFonts.permanentMarker(fontSize: 25),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_box),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatPage()));
              },
              icon: const Icon(Icons.chat_bubble),
            ),
            IconButton(
              onPressed: () async {
                final user =
                    await Provider.of<Auth>(context, listen: false).signOut();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.logout),
            ),
          ],
          backgroundColor: appBarColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                homePageWidget(),
                homePageWidget(),
                homePageWidget(),
                homePageWidget(),
                homePageWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
