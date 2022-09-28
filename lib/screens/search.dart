import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  static const id = '/search';
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
