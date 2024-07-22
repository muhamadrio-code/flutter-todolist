import 'package:flutter/material.dart';
import 'package:todo_list/constraints/color.dart';
import 'package:todo_list/model/todo.dart';
import 'package:todo_list/widgets/todo_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoList = Todo.todoList();
  final TextEditingController _todoInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBgColor,
      appBar: _buildAppBar(),
      body: ListView(children: [
        for (Todo todo in todoList)
          TodoItem(
            todo: todo,
            onDeleteItem: onTodoDelete,
            onChangeItem: onTodoChange,
          )
      ]),
      floatingActionButton: _fab(context),
    );
  }

  void onTodoDelete(Todo todo) {
    setState(() {
      todoList.remove(todo);
    });
  }

  void onTodoChange(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _addTodo(String content) {
    setState(() {
      final newTodo = Todo(id: DateTime.now().toString(), content: content);
      todoList.insert(0, newTodo);
      _todoInput.clear();
    });
  }

  Widget _fab(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _openDialog(context),
      tooltip: "Add Todo",
      child: const Icon(Icons.add),
    );
  }

  Future<dynamic> _openDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('New Todo'),
          content: TextField(
            controller: _todoInput,
            decoration: const InputDecoration(hintText: "Title"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('cancel'),
              onPressed: () {
                _todoInput.clear();
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('ok'),
              onPressed: () {
                _addTodo(_todoInput.text);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBgColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            color: tdBlack,
            size: 30,
          ),
          const Expanded(
            child: Text(
              "All Todo",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
              height: 40,
              width: 40,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/images/avatar.jpg')))
        ],
      ),
    );
  }

  @override
  void dispose() {
    _todoInput.dispose();
    super.dispose();
  }
}
