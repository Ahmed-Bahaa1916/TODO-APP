class Todo {
  final String title;
  final bool isDone;

  Todo({required this.title, this.isDone = false});

  // هنا بنعمل نسخة جديدة من الـ object مع إمكانية تغيير أي قيمة
  Todo copyWith({String? title, bool? isDone}) {
    return Todo(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    );
  }
}
