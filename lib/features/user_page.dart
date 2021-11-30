import 'package:book_bank/features/book_page.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade200,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => BookPage()));
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.black)),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        width: 500,
        height: 500,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('images/Profile.png'),
                backgroundColor: Colors.blue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
          ],
        ),
      ),
    );
  }
}
