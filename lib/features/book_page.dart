import 'package:flutter/material.dart';

class BookPage extends StatelessWidget {
  const BookPage({Key? key,this.username,this.bookId}) : super(key: key);
  final String? username,bookId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Welcome',
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Pacifico',
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {

              },
              icon: Icon(
                Icons.book,
                color: Colors.black,
                size: 30.0,
              )),
          SizedBox(
            width: 15,
          ),
          IconButton(
              onPressed: () {
                userAlert(context);
              },
              icon: Icon(
                Icons.person,
                color: Colors.black,
                size: 30.0,
              )),
        ],
        backgroundColor: Colors.orange.shade200,
      ),
      body: SizedBox.shrink()
      // Padding(
      //   padding: const EdgeInsets.all(15.0),
      //   child: GridView.count(
      //     crossAxisCount: 4,
      //     crossAxisSpacing: 5,
      //     mainAxisSpacing: 10,
      //     scrollDirection: Axis.vertical,
      //     children: [
      //       BookCard(imageUrl: 'https://storage.googleapis.com/lr-assets/_nielsen/400/9780141325545.jpg', bname: 'A Tale of Two Cities', author: 'Charles Dickens',),
      //       BookCard(imageUrl: 'https://storage.googleapis.com/lr-assets/_nielsen/400/9780141325545.jpg', bname: 'A Tale of Two Cities', author: 'Charles Dickens',),
      //       BookCard(imageUrl: 'https://storage.googleapis.com/lr-assets/_nielsen/400/9780141325545.jpg', bname: 'A Tale of Two Cities', author: 'Charles Dickens',),
      //       BookCard(imageUrl: 'https://storage.googleapis.com/lr-assets/_nielsen/400/9780141325545.jpg', bname: 'A Tale of Two Cities', author: 'Charles Dickens',),
      //       BookCard(imageUrl: 'https://storage.googleapis.com/lr-assets/_nielsen/400/9780141325545.jpg', bname: 'A Tale of Two Cities', author: 'Charles Dickens',),
      //       BookCard(imageUrl: 'https://storage.googleapis.com/lr-assets/_nielsen/400/9780141325545.jpg', bname: 'A Tale of Two Cities', author: 'Charles Dickens',),
      //       BookCard(imageUrl: 'https://storage.googleapis.com/lr-assets/_nielsen/400/9780141325545.jpg', bname: 'A Tale of Two Cities', author: 'Charles Dickens',),
      //       BookCard(imageUrl: 'https://storage.googleapis.com/lr-assets/_nielsen/400/9780141325545.jpg', bname: 'A Tale of Two Cities', author: 'Charles Dickens',)
      //     ],
      //   ),
      // ),
    );
  }
}

void buyAlert(BuildContext context) {
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
            addAlert(context);
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

void userAlert(BuildContext context) {
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
            Navigator.pushReplacementNamed(context, 'loginPage');
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

class BookCard extends StatelessWidget {
  BookCard({Key? key,this.imageUrl,this.bname,this.author}) : super(key: key);
  final String? imageUrl,bname,author;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        buyAlert(context);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.orange.shade200),
        width: 250,
        height: 400,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 30.0, bottom: 15.0),
              child: Container(
                width: 150,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage(imageUrl??'https://leadershiftinsights.com/wp-content/uploads/2019/07/no-book-cover-available.jpg'),
                      fit: BoxFit.cover
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 150,
              child: Divider(
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                height: 80,
                child: Card(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                        const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            Text(
                              'Name: ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Pacifico',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              bname??'N/A',
                              style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontFamily: 'Pacifico',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Text(
                            'Author: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Pacifico',
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            author??'N/A',
                            style: TextStyle(
                                color: Colors.lightBlue,
                                fontFamily: 'Pacifico',
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
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
