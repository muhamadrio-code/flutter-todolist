import 'package:flutter/material.dart';
import 'package:todo_list/constraints/color.dart';
import 'package:todo_list/model/todo.dart';

typedef TodoItemHandler = void Function(Todo todo);

class TodoItem extends StatelessWidget {
  final Todo todo;
  final TodoItemHandler? onDeleteItem;
  final TodoItemHandler? onChangeItem;
  const TodoItem(
      {super.key, required this.todo, this.onDeleteItem, this.onChangeItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _symmetric(v: 8.0, h: 16.0),
      child: ListTile(
        onTap: () => onChangeItem?.call(todo),
        shape: _smallRoundedRectBorder(),
        tileColor: tdBgColor,
        contentPadding: _symmetric(v: 16, h: 16),
        leading: _leadingIcon(),
        title: _title(),
        trailing: _trailing(),
      ),
    );
  }

  Widget _title() {
    return Text(
      todo.content,
      style: TextStyle(
          color: tdBlack,
          fontSize: 16,
          decoration: todo.isDone ? TextDecoration.lineThrough : null),
    );
  }

  Icon _leadingIcon() {
    return Icon(
      todo.isDone ? Icons.check_box : Icons.check_box_outline_blank_outlined,
      color: const Color.fromARGB(255, 36, 36, 36),
    );
  }

  ShapeBorder _smallRoundedRectBorder() {
    return const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)));
  }

  EdgeInsetsGeometry _symmetric({double v = 0.0, double h = 0.0}) {
    return EdgeInsets.symmetric(vertical: v, horizontal: h);
  }

  Widget _trailing() {
    return IconButton(
      color: tdRed,
      icon: const Icon(
        Icons.delete,
      ),
      onPressed: () {
        onDeleteItem?.call(todo);
      },
      style: ButtonStyle(backgroundColor: WidgetStateProperty.all(tdBgColor)),
    );
  }
}
