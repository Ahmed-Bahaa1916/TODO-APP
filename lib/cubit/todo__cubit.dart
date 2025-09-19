import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/todo__state.dart';

import '../class/todo_class.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoState(todos: []));

  void addTodo(String title) {
    final newTodo = Todo(title: title);
    emit(TodoState(todos: [...state.todos, newTodo]));
  }

  void toggleTodo(int index) {
    final updatedTodos = [...state.todos];
    final todo = updatedTodos[index];
    updatedTodos[index] = Todo(title: todo.title, isDone: !todo.isDone);
    emit(TodoState(todos: updatedTodos));
  }

  void deleteTodo(int index) {
    final updatedTodos = [...state.todos]..removeAt(index);
    emit(TodoState(todos: updatedTodos));
  }
}
