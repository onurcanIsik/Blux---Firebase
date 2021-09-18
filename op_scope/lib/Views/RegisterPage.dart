// ignore_for_file: file_names, avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:op_scope/Services/auth.dart';
import 'package:op_scope/colors.dart';
import 'package:provider/provider.dart';

import 'LoginPage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final fireStore = FirebaseFirestore.instance;

  String inputEmail = "";
  String inputPassword = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: SizedBox(
            height: 60,
            width: 60,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.indigo,
                size: 30,
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final user = await Provider.of<Auth>(context, listen: false)
                      .createSignInEmail(inputEmail, inputPassword);
                  if (!user.emailVerified) {
                    await user.sendEmailVerification();
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                }
              },
              elevation: 5,
            ),
          ),
          backgroundColor: appBarColor,
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 30,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Icon(
                        Icons.donut_large_rounded,
                        size: 90,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        onChanged: (String value) {
                          inputEmail = value;
                        },
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                        validator: (index) {
                          if (index!.isEmpty) {
                            return "Lütfen bir e mail girin";
                          } else if (!EmailValidator.validate(index)) {
                            return "Geçerli bir e posta girin!";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "E-Mail",
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          fillColor: Colors.indigo,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white70,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white70,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.white70,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        maxLength: 10,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                        validator: (index) {
                          if (index!.isEmpty) {
                            return "Lütfen şifre yazın";
                          } else if (index.length < 4) {
                            return "Lütfen 3 karakterden daha uzun bir şifre girin";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (String value) {
                          inputPassword = value;
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          fillColor: Colors.indigo,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white70,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white70,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.white70,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        maxLength: 10,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                        validator: (index) {
                          if (index!.isEmpty) {
                            return "Lütfen şifre yazın";
                          } else if (index.length < 4) {
                            return "Lütfen 3 karakterden daha uzun bir şifre girin";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (String value) {
                          inputPassword = value;
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          fillColor: Colors.indigo,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white70,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white70,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.white70,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Do you already have an account ? ",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
