// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';

Widget homePageWidget() => SizedBox(
      height: 315,
      width: 400,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                "Onurcan Işık",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 100,
              ),
              Text("17/09/2021"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("What a beautiful views"),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 340,
                child: Image.asset(
                  "assets/images/10-breathtaking-views-1-orig.jpg",
                  fit: BoxFit.scaleDown,
                ),
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.chat_outlined),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Text(
                      "BL",
                      style: GoogleFonts.permanentMarker(
                          fontSize: 20, color: appBarColor),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
