import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String fieldDescription;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  const CustomTextField({
    super.key,
    required this.fieldDescription,
    required this.controller,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldDescription,
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            disabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }
}
