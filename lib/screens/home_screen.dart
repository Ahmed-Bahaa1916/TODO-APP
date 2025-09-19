import 'package:flutter/material.dart';
import 'package:todo/widgets/todo_card.dart';
import '../widgets/bottom_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> tasks = []; // هنا بنخزن كل الـ tasks

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(58, 66, 86, 1),
        title: const Text(
          'Todo App',
          style: TextStyle(
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: tasks.isEmpty
          ? const Center(
        child: Text(
          "No tasks yet",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      )
          : ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TodoCard(text: tasks[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTask = await showModalBottomSheet<String>(
            context: context,
            isScrollControlled: true,
            builder: (context) => Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: AddTask(),
            ),
          );

          if (newTask != null) {
            setState(() {
              tasks.add(newTask); // أضف التاسك للليست
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
