import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String text;
  final VoidCallback? onDelete;
  final VoidCallback? onComplete;
  final bool isDone;

  const TodoCard({
    super.key,
    required this.text,
    this.onDelete,
    this.onComplete,
    this.isDone = false,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(209, 224, 224, 0.2),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  decoration:
                  isDone ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close, size: 30, color: Colors.red),
              onPressed: onDelete,
            ),
            IconButton(
              icon: Icon(
                Icons.task_alt,
                size: 30,
                color: isDone ? Colors.green : Colors.blue,
              ),
              onPressed: onComplete,
            ),
          ],
        ),
      ),
    );
  }
}
