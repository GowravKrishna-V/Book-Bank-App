import 'package:book_bank/features/register_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
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
                                padding: const EdgeInsets.only(left: 35.0),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(context, 'registerPage');
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
                              Padding(
                                padding: const EdgeInsets.only(left: 166.0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 51.5),
                                    primary: Colors.orange.shade200,
                                    onPrimary: Colors.black,
                                  ),
                                  onPressed: () {
                                    print('Pressed');
                                  },
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
