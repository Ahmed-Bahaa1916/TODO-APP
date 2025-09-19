import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  AddTask({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            'Add Task',
            style: TextStyle(fontSize: 30),
          ),
          TextField(
            controller: _controller,
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              hintText: 'Enter task name',
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              final taskText = _controller.text.trim();
              if (taskText.isNotEmpty) {
                Navigator.pop(context, taskText);
              }
            },
            child: const Text(
              'Add',
              style: TextStyle(fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }
}
