import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color.fromRGBO(209, 224, 224, 0.2),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'AHMED BAHAAflskdjdsofdjdsiokjfiokjiosdjiofoijdsfofdsdsffjioio',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            Icon(Icons.close, size: 32, color: Colors.red),
          ],
        ),
      ),
    );
  }
}
