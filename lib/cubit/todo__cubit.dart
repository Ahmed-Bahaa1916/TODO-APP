// todo_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/todo__state.dart';

import '../class/todo_class.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());

  final List<Todo> _todos = [];

  void addTask(String title) {
    _todos.add(Todo(title: title));
    emit(TodoLoaded(List.from(_todos)));
  }

  void deleteTask(int index) {
    _todos.removeAt(index);
    emit(TodoLoaded(List.from(_todos)));
  }

  void toggleTask(int index) {
    _todos[index] = _todos[index].copyWith(isDone: !_todos[index].isDone);
    emit(TodoLoaded(List.from(_todos)));
  }
}
