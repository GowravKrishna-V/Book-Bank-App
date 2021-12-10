class User {
  String _name = '';
  String get name => _name;
  set name(String a) {
    _name = a;
  }

  String? _bid = null;
  String? get bid => _bid;
  set bid(String? b) {
    _bid = b;
  }
}
