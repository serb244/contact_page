import 'package:flutter/material.dart';

class FormIcon extends StatelessWidget {
  const FormIcon({super.key});
  static const iconRadius = 45.0;
  static const iconBoxSize = 60.0;
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: iconBoxSize,
      child: CircleAvatar(
        radius: 45,
        backgroundColor: Colors.amber,
        child: Icon(
          Icons.lock_open,
          color: Colors.brown,
        ),
      ),
    );
  }
}
