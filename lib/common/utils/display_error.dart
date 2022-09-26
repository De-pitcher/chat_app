import 'package:chat_app/common/common.dart';
import 'package:flutter/material.dart';

class DisplayError extends StatelessWidget {
  final Object error;
  final Function()? onPressed;
  const DisplayError({super.key, required this.error, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(Icons.warning, color: Colors.red, size: 48),
      title: const Text(
        'Error',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            error.toString(),
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          TextButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) => states.contains(MaterialState.hovered)
                      ? Colors.transparent
                      : AppColor.blueColor),
            ),
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    );
  }
}
