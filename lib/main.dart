import 'package:book_bank/features/login_page.dart';
import 'package:book_bank/features/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'loginPage',
      routes: {
        'loginPage':(context)=>LoginPage(),
        'registerPage':(context)=> RegisterPage()
      },
    );
  }
}


