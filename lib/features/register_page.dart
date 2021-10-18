import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
                            obscureText: false,
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
                            obscureText: true,
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
                              padding: const EdgeInsets.symmetric(horizontal: 34.0),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(context, 'loginPage');
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
                            Padding(
                              padding: const EdgeInsets.only(left: 160.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 40),
                                  primary: Colors.orange.shade200,
                                  onPrimary: Colors.black,
                                ),
                                onPressed: () {
                                  print('Pressed');
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
