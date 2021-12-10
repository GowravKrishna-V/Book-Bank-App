import 'dart:convert';

List<RemoveBookId> removeBookIdFromJson(String str) => List<RemoveBookId>.from(
    json.decode(str).map((x) => RemoveBookId.fromJson(x)));

String removeBookIdToJson(List<RemoveBookId> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RemoveBookId {
  RemoveBookId({
    required this.rid,
    required this.rusername,
    required this.rpassword,
    required this.rbookId,
  });

  String rid;
  String rusername;
  String rpassword;
  String rbookId;

  factory RemoveBookId.fromJson(Map<String, dynamic> json) => RemoveBookId(
        rid: json["_id"],
        rusername: json["username"],
        rpassword: json["password"],
        rbookId: json["book_id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": rid,
        "username": rusername,
        "password": rpassword,
        "book_id": rbookId,
      };
}
