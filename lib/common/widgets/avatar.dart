import 'package:chat_app/common/common.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String? imageUrl;
  final bool isOnline;
  final bool? isUserAvatar, isNetwork;
  const Avatar({
    Key? key,
    this.imageUrl,
    required this.isOnline,
    this.isUserAvatar,
    this.isNetwork,
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
                ? isNetwork == true
                    ? Image.network(imageUrl!)
                    : Image.asset(imageUrl!)
                : isUserAvatar == false
                    ? const Icon(Icons.add)
                    : const Icon(Icons.person),
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
