import 'package:chat_app/utils/utils.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String? imageUrl;
  final bool isOnline;
  const Avatar({
    Key? key,
    this.imageUrl,
    required this.isOnline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          child: Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              border: imageUrl == null
                  ? Border.all(color: AppColor.greyColor, width: 2)
                  : null,
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: imageUrl != null
                ? Image.asset(imageUrl!)
                : const Icon(Icons.add),
          ),
        ),
        isOnline
            ? Positioned(
              bottom: 0,
              right: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const Icon(
                    Icons.circle,
                    color: Colors.green,
                    size: 15,
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
