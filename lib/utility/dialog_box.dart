// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_aplication_9hour/utility/my_button.dart';

class DialogBox extends StatelessWidget {
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple[300],
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //? get user input
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a new task',
              ),
            ),

            //? buttons => save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //! Cancel button
                MyButton(text: 'Cancel', onPressed: onCancel),

                const SizedBox(width: 7),

                //! Save button
                MyButton(text: 'Save', onPressed: onSave)
              ],
            )
          ],
        ),
      ),
    );
  }
}
