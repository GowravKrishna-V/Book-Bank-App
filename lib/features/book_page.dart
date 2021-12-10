import 'package:blur/blur.dart';
import 'package:book_bank/features/book_list.dart';
import 'package:book_bank/features/login_page.dart';
import 'package:book_bank/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
import 'book_ret.dart';
import 'dropbar.dart';

class BookPage extends ConsumerStatefulWidget {
  BookPage({Key? key, this.username, this.bookId}) : super(key: key);
  final String? username, bookId;

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends ConsumerState<BookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Welcome ${ref.read(userProvider).name}',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Pacifico',
                color: Colors.white,
              ),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  // gBookAlert(context);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => getBookList()));
                },
                icon: Icon(
                  Icons.book,
                  color: Colors.white,
                  size: 30.0,
                )),
            SizedBox(
              width: 15,
            ),
            IconButton(
                onPressed: () {
                  userAlert(context, ref);
                },
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30.0,
                )),
          ],
          backgroundColor: Color(0xFFDC143C),
        ),
        body:
            // SizedBox.shrink()
            FutureBuilder(
                future: getPost(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<RetriveBook>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GridView.count(
                        crossAxisCount:
                            (MediaQuery.of(context).size.width - 80) ~/
                                (snapshot.data!.length * 80),
                        mainAxisSpacing: 20,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: snapshot.data!.map((reminder) {
                          return BookCard(
                            bname: reminder.bookName,
                            author: reminder.bookAuth,
                            imageUrl: reminder.bookImg,
                            bokid: reminder.bookId,
                            // isTaken: false,
                          );
                        }).toList(),
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }));
  }
}

void buyAlert(BuildContext context) {
  var alert = AlertDialog(
    title: Center(
        child: Text(
      'Alert',
      style: TextStyle(
        fontFamily: 'Pacifico',
        color: Color(0xFFDC143C),
      ),
    )),
    content: Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Text(
        'Do you want to get this Book?',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.orange.shade200,
            onPrimary: Colors.black,
          ),
          onPressed: () {
            var isTaken;
            if (isTaken == false) {
              addAlert(context);
            } else {
              Navigator.pop(context, 'buyAlert');
              cbuyAlert(context);
            }
          },
          child: Text(
            'Yes',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 65.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.orange.shade200,
              onPrimary: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context, 'buyAlert');
            },
            child: Text(
              'No',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )),
      ),
    ],
  );

  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}

void cbuyAlert(BuildContext context) {
  var cnalert = AlertDialog(
    title: Icon(
      Icons.sentiment_dissatisfied_outlined,
      color: Colors.yellow,
      size: 40,
    ),
    content: Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Text(
        'Cannot take more than one book at a time',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
  );

  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return cnalert;
      });
}

void addAlert(BuildContext context) {
  var aalert = AlertDialog(
    title: Icon(
      Icons.task_alt,
      color: Colors.green,
      size: 40,
    ),
    content: Padding(
      padding: const EdgeInsets.only(left: 50.0),
      child: Text(
        'Successfully Added',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 65.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.orange.shade200,
            onPrimary: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context, 'addAlert');
            Navigator.pop(context, 'buyAlert');
          },
          child: Text(
            'Ok',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ],
  );

  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return aalert;
      });
}

void userAlert(BuildContext context, WidgetRef ref) {
  var ualert = AlertDialog(
    title: Container(
      height: 120.0,
      width: 120.0,
      decoration: BoxDecoration(
        color: Colors.orange.shade200,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('images/Profile.png'),
          fit: BoxFit.fitHeight,
        ),
      ),
    ),
    content: Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'User: ${ref.read(userProvider).name}',
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Pacifico',
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(bottom: 15.0, right: 16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            primary: Colors.red,
            onPrimary: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context, 'userAlert');
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          child: Text(
            'Log Out',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ],
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return ualert;
      });
}

class BookCard extends ConsumerWidget {
  BookCard({Key? key, this.imageUrl, this.bname, this.author, this.bokid})
      : super(key: key);
  final String? imageUrl, bname, author, bokid;
  var isTaken;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (bokid != null) {
      isTaken = true;
    }
    return bokid == ref.read(userProvider).bid
        ? Stack(children: [
            Blur(
              blur: 4,
              child: TextButton(
                onPressed: () {
                  buyAlert(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Card(
                    color: Colors.orange.shade200,
                    borderOnForeground: true,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Image(
                              image: NetworkImage(imageUrl ??
                                  'https://leadershiftinsights.com/wp-content/uploads/2019/07/no-book-cover-available.jpg')),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Name: ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Pacifico',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              bname ?? 'N/A',
                              style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontFamily: 'Pacifico',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Author: ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Pacifico',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              author ?? 'N/A',
                              style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontFamily: 'Pacifico',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFDC143C),
                      border: Border.all(
                        color: Color(0xFFDC143C),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  width: 100,
                  height: 100,
                  child: Center(
                      child: Text(
                    'Taken',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pacifico',
                    ),
                  ))),
            )
          ])
        : TextButton(
            onPressed: () {
              buyAlert(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Card(
                color: Colors.orange.shade200,
                borderOnForeground: true,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Image(
                          image: NetworkImage(imageUrl ??
                              'https://leadershiftinsights.com/wp-content/uploads/2019/07/no-book-cover-available.jpg')),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Name: ',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Pacifico',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          bname ?? 'N/A',
                          style: TextStyle(
                              color: Colors.lightBlue,
                              fontFamily: 'Pacifico',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Author: ',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Pacifico',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          author ?? 'N/A',
                          style: TextStyle(
                              color: Colors.lightBlue,
                              fontFamily: 'Pacifico',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}

Future<List<RetriveBook>> getPost() async {
  var url = Uri.parse('${baseUrl}getAllBooks');
  final response = await http.get(url);
  // print(response.body);
  return retriveBookFromJson(response.body);
}
