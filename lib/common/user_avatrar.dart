import 'package:chat_app/common/common.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String userName;
  final String? imageUrl;
  final int numberOfUnreadMessage;
  final bool isOnline;
  const UserAvatar({
    Key? key,
    required this.userName,
    this.imageUrl,
    required this.numberOfUnreadMessage, required this.isOnline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Avatar(
              imageUrl: imageUrl,
              isOnline: isOnline,
            ),
            Text(
              userName,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
        numberOfUnreadMessage > 1
            ? Positioned(
                top: 0,
                right: 0,
                child: Container(
                  height: 20,
                  width: 22,
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints:
                      const BoxConstraints(maxHeight: 20, maxWidth: 20),
                  child: Center(
                    child: Text(
                      '$numberOfUnreadMessage',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
