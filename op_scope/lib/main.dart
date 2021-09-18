// ignore_for_file: avoid_print
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:op_scope/Views/RegisterPage.dart';
import 'package:op_scope/colors.dart';
import 'package:provider/provider.dart';
import 'Services/auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    Provider<Auth>(
      create: (context) => Auth(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      ),
    ),
  );
}

//Google font ile appbar yazısını düzelt
//Uygulama Logosunu Başlangıca ekle

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          backgroundColor: appBarColor,
          child: const Icon(Icons.arrow_forward),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const RegisterPage()));
          },
          elevation: 5,
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        backgroundColor: appBarColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(100, 20),
          ),
        ),
        title: Text(
          "Blux",
          style: GoogleFonts.permanentMarker(fontSize: 25),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 120),
            const Icon(
              Icons.donut_large_rounded,
              size: 70,
              color: Colors.indigoAccent,
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Blux'a Hoşgeldin",
                  style:
                      GoogleFonts.comfortaa(color: appBarColor, fontSize: 25),
                ),
                const SizedBox(width: 10),
                const Text(
                  "👋",
                  style: TextStyle(fontSize: 40),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
