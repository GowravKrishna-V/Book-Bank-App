import 'dart:io';

import 'package:book_bank/constants.dart';
import 'package:book_bank/features/login_page.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';

import '../main.dart';
import 'book_page.dart';

class RegisterPage extends ConsumerWidget {
  RegisterPage({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final cpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/Bookbg.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 30),
                  width: 500,
                  height: 600,
                  child: Card(
                    elevation: .5,
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        Text(
                          'BOOK BANK',
                          style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange.shade200,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: 400,
                          child: TextField(
                            controller: usernameController,
                            obscureText: false,
                            cursorColor: Color(0xFF7E7E7E),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                              labelText: 'Username',
                              labelStyle: TextStyle(
                                fontFamily: 'Lobster',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF7E7E7E),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: 400,
                          child: TextField(
                            controller: passwordController,
                            obscureText: true,
                            cursorColor: Color(0xFF7E7E7E),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                fontFamily: 'Lobster',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF7E7E7E),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: 400,
                          child: TextField(
                            controller: cpasswordController,
                            obscureText: true,
                            cursorColor: Color(0xFF7E7E7E),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                              labelText: 'Confirm Password',
                              labelStyle: TextStyle(
                                fontFamily: 'Lobster',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF7E7E7E),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                                },
                                child: Text(
                                  'Login?',
                                  style: TextStyle(
                                    color: Colors.orange.shade200,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(child: SizedBox.shrink()),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 40),
                                  primary: Colors.orange.shade200,
                                  onPrimary: Colors.black,
                                ),
                                onPressed: () {
                                  if (passwordController.text !=
                                      cpasswordController.text)
                                    CoolAlert.show(
                                      context: context,
                                      type: CoolAlertType.warning,
                                      text: "Enter your password correctly!",
                                    );
                                  else
                                    registerUser(usernameController.text,
                                            passwordController.text)
                                        .then((value) => {
                                              if (value)
                                                {
                                                  ref.read(userProvider).name =
                                                      usernameController.text,
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              BookPage()))
                                                }
                                              else
                                                CoolAlert.show(
                                                  backgroundColor:
                                                      Colors.orange.shade200,
                                                  confirmBtnColor:
                                                      Colors.orange.shade200,
                                                  barrierDismissible: true,
                                                  context: context,
                                                  type: CoolAlertType.error,
                                                  text:
                                                      "Couldn\'t register user",
                                                )
                                            });
                                },
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<bool> registerUser(String name, String password) async {
  var dio = Dio();
  var response;
  try {
    response = await dio.post(
      baseUrl + 'register',
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
      data: jsonEncode({'username': name, 'password': password}),
    );
    // print(response);
  } catch (e) {
    return false;
  }
  if (response.statusCode == 200 && !response.data.isEmpty) return true;
  return false;
}
