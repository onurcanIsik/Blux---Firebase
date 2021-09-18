// ignore_for_file: file_names, avoid_print
import 'package:flutter/material.dart';
import 'package:op_scope/Services/auth.dart';
import 'package:provider/provider.dart';
import '../colors.dart';
import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
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
            height: 70,
            width: 70,
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
                      .signInEmail(inputEmail, inputPassword);
                  print(user.uid);
                  if (!user.emailVerified) {
                    await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const AlertDialog(
                            title: Text("Doğru bilgi girin!"),
                          );
                        });
                    await Provider.of<Auth>(context, listen: false).signOut();
                  } else {
                    const AlertDialog(title: Text("Yanlış Bilgi Girdiniz !"));
                  }
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                } else {
                  SnackBar(
                    content: const Text("Deneme"),
                    action: SnackBarAction(
                      label: "Deneme",
                      onPressed: () {},
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
                      const SizedBox(height: 50),
                      const Icon(
                        Icons.donut_large_rounded,
                        size: 90,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 50),
                      const Text(
                        "Login",
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
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                        validator: (index) {
                          if (index!.isEmpty) {
                            return "Lütfen e-mail yazınız";
                          } else if (index.length < 4) {
                            return "Geçerli bir eposta giriniz";
                          } else {
                            return null;
                          }
                        },
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
                        onChanged: (String value) {
                          inputPassword = value;
                        },
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
                            "Don't have an account yet ?",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
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
