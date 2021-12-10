import 'package:book_bank/features/book_page.dart';
import 'package:book_bank/features/rem_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:book_bank/main.dart';
import '../constants.dart';
import 'book_ret.dart';
import 'package:http/http.dart' as http;

class getBookList extends ConsumerStatefulWidget {
  const getBookList({Key? key}) : super(key: key);

  @override
  _getBookListState createState() => _getBookListState();
}

class _getBookListState extends ConsumerState<getBookList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 25.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => BookPage()));
                },
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          BookBuild(),
        ],
      ),
    );
  }
}

class BookBuild extends StatelessWidget {
  const BookBuild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
          future: getPost(),
          builder: (BuildContext context,
              AsyncSnapshot<List<RetriveBook>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.count(
                  crossAxisCount: (MediaQuery.of(context).size.width - 80) ~/
                      (snapshot.data!.length * 80),
                  mainAxisSpacing: 20,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: snapshot.data!.map((reminder) {
                    return BookCardPage(
                      bname: reminder.bookName,
                      author: reminder.bookAuth,
                      imageUrl: reminder.bookImg,
                      rbokid: reminder.bookId,
                    );
                  }).toList(),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

class BookCardPage extends ConsumerWidget {
  const BookCardPage(
      {Key? key, this.imageUrl, this.bname, this.author, this.rbokid})
      : super(key: key);
  final String? imageUrl, bname, author, rbokid;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.read(userProvider).bid == rbokid) {
      return Card(
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
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextButton(
                    onPressed: () {
                      delAlert(context, ref);
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.red.shade500,
                      size: 30.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}

void delAlert(BuildContext context, ref) {
  var alert = AlertDialog(
    title: Center(
        child: Text(
      'Alert',
      style: TextStyle(
        fontFamily: 'Pacifico',
      ),
    )),
    content: Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Text(
        'Do you want to remove this this Book?',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red.shade500,
              onPrimary: Colors.black,
            ),
            onPressed: () {
              remAlert(context, ref);
            },
            child: Text(
              'Yes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.orange.shade200,
              onPrimary: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context, 'delAlert');
            },
            child: Text(
              'No',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      )
    ],
  );

  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}

void remAlert(BuildContext context, WidgetRef ref) {
  var ralert = AlertDialog(
    title: Icon(
      Icons.delete_outline,
      color: Colors.red.shade500,
      size: 40,
    ),
    content: Padding(
      padding: const EdgeInsets.only(left: 50.0),
      child: Text(
        'Successfully Removed',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 45.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.orange.shade200,
            onPrimary: Colors.black,
          ),
          onPressed: () {
            // editPost(post).then(){}};
            ref.read(userProvider).bid = null;
            Navigator.pop(context, 'remAlert');
            Navigator.pop(context, 'delAlert');
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
        return ralert;
      });
}

Future<List<RemoveBookId>> getRPost(ref) async {
  var url = Uri.parse('${baseUrl}removeBook/${ref.read(userProvider).name}');
  final response = await http.get(url);
  // print(response.body);
  return removeBookIdFromJson(response.body);
}
