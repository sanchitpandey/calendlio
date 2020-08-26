import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  IconData icon;
  String hint;
  TextInputType type = TextInputType.text;
  TextEditingController onComplete;

  Input(this.icon, this.hint, this.onComplete, {this.type});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: TextFormField(
        controller: onComplete,
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter ' + hint;
          }
          return null;
        },
        keyboardType: type,
        decoration: InputDecoration(
          hintText: hint,
        ),
      ),
    );
  }
}
