import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String text;

  const TodoCard({super.key, required this.text});

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
                style: const TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            const Icon(Icons.close, size: 32, color: Colors.red),
            SizedBox(width: 5),
            const Icon(Icons.task_alt, size: 32, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
