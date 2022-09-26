import 'package:chat_app/common/common.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Row(
        children: const [
          CircularProgressIndicator(
            color: AppColor.blueColor,
          ),
          SizedBox(width: 20),
          Text(
            'Loading',
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
