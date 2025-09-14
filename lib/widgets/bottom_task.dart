import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Column(
        children: [
          Text('Add Task',style: TextStyle(fontSize: 30),),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
          ),
          TextButton(onPressed: () {}, child: Text('Add',style: TextStyle(fontSize: 22),)),
        ],
      ),
    );
  }
}
