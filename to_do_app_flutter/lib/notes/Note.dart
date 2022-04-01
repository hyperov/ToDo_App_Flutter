class Note {
  String title = "Note";
  String desc = "";
  bool pinned = false;
  background backgroundColor = background.white;
  late DateTime createdAt;
  late DateTime lastEdit;
}

enum background { white, red, purple, orange, blue, green }
