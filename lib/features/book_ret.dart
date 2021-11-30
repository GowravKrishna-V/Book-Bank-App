// To parse this JSON data, do
//
//     final retriveBook = retriveBookFromJson(jsonString);

import 'dart:convert';

List<RetriveBook> retriveBookFromJson(String str) => List<RetriveBook>.from(
    json.decode(str).map((x) => RetriveBook.fromJson(x)));

String retriveBookToJson(List<RetriveBook> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RetriveBook {
  RetriveBook({
    required this.id,
    required this.bookId,
    required this.bookName,
    required this.bookImg,
    required this.bookAuth,
    required this.bookYear,
  });

  String id;
  String bookId;
  String bookName;
  String bookImg;
  String bookAuth;
  String bookYear;

  factory RetriveBook.fromJson(Map<String, dynamic> json) => RetriveBook(
        id: json["_id"],
        bookId: json["book_id"],
        bookName: json["book_name"],
        bookImg: json["book_img"],
        bookAuth: json["book_auth"],
        bookYear: json["book_year"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "book_id": bookId,
        "book_name": bookName,
        "book_img": bookImg,
        "book_auth": bookAuth,
        "book_year": bookYear,
      };
}
