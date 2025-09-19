import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/todo__cubit.dart';
import '../cubit/todo__state.dart';
import '../widgets/todo_card.dart';
import '../widgets/bottom_task.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state is TodoLoaded && state.todos.isNotEmpty) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                final todo = state.todos[index];
                return TodoCard(
                  text: todo.title,
                  isDone: todo.isDone,
                  onDelete: () => context.read<TodoCubit>().deleteTask(index),
                  onComplete: () => context.read<TodoCubit>().toggleTask(index),
                );
              },
            );
          }
          return const Center(
            child: Text(
              "No tasks yet",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          );
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

          if (newTask != null && newTask.isNotEmpty) {
            context.read<TodoCubit>().addTask(newTask);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
