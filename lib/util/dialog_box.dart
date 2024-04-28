import 'package:flutter/material.dart';
import 'package:todolist/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;

  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 150,
        child: Column(
          children: [
            // get user input
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Todo task',
                ),
              ),
            ),

            // buttons save and cancle
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                MyButton(text: "Save", onPressed: onSave),

                const SizedBox(
                  width: 8,
                ),

                // cancel button
                MyButton(text: "Cancle", onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
