import 'package:book_bank/features/book_page.dart';
import 'package:book_bank/features/register_page.dart';
import 'package:book_bank/main.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
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
                  height: 500,
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
                            controller: nameController,
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
                                          builder: (context) =>
                                              RegisterPage()));
                                },
                                child: Text(
                                  'Register?',
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.orange.shade200,
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
                                      vertical: 20, horizontal: 51.5),
                                  primary: Colors.orange.shade200,
                                  onPrimary: Colors.black,
                                ),
                                onPressed: () =>
                                    loginUser(nameController.text, ref).then(
                                  (value) => {
                                    if (value)
                                      {
                                        ref.read(userProvider).name =
                                            nameController.text,
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BookPage()))
                                      }
                                    else
                                      CoolAlert.show(
                                        backgroundColor: Colors.orange.shade200,
                                        confirmBtnColor: Colors.orange.shade200,
                                        barrierDismissible: true,
                                        context: context,
                                        type: CoolAlertType.error,
                                        text: "No user found",
                                      ),
                                  },
                                ),
                                child: Text(
                                  'Login',
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

Future<bool> loginUser(String name, ref) async {
  var dio = Dio();
  var response;
  try {
    response = await dio.get(baseUrl + 'login/' + name);
  } catch (e) {
    return false;
  }
  if (response.statusCode == 200 &&
      !response.data.isEmpty &&
      !response.data.first.containsKey('message')) {
    final bkid = ref.read(userProvider).bid = response.data.first['book_id'];
    return true;
  }

  return false;
}
