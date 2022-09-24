import 'package:flutter/material.dart';

class User extends StatefulWidget {
  static const id = '/user';
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text('User Profile'),
          )
        ],
      ),
    );
  }
}
