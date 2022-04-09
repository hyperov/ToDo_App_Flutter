class Note {
  String title;
  String desc;

  bool pinned;

  int backgroundColorIndex;

  late DateTime createdAt;
  late DateTime lastEdit;

  Note({
    required this.title,
    required this.desc,
    required this.createdAt,
    required this.lastEdit,
    this.pinned = false,
    this.backgroundColorIndex = 0,
  });
}
