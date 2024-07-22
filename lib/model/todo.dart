class Todo {
  final String id;
  String content;
  bool isDone;

  Todo({required this.id, required this.content, this.isDone = false});

  static List<Todo> todoList() {
    return [
      Todo(id: '01', content: 'Morning Excercise', isDone: true),
      Todo(id: '02', content: 'Buy Groceries', isDone: true),
      Todo(
        id: '03',
        content: 'Check Emails',
      ),
      Todo(
        id: '04',
        content: 'Team Meeting',
      ),
      Todo(
        id: '05',
        content: 'Work on mobile apps for 2 hour',
      ),
      Todo(
        id: '06',
        content: 'Dinner with Jenny',
      ),
    ];
  }
}
