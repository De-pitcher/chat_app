import 'package:chat_app/common/common.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final String? imageUrl;
  final int numberOfUnreadMessage;
  final String userName, lastMessage, lastSeen;
  final bool isOnline;
  const ChatTile({
    Key? key,
    this.imageUrl,
    required this.lastSeen,
    required this.userName,
    required this.lastMessage,
    required this.numberOfUnreadMessage, required this.isOnline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        height: 56,
        margin: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Avatar(
              imageUrl: imageUrl,
              isOnline: isOnline,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    lastMessage,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
            numberOfUnreadMessage < 1
                ? Text(
                    lastSeen,
                    style: Theme.of(context).textTheme.headline6,
                  )
                : Column(
                    children: [
                      Text(
                        lastSeen,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      const SizedBox(height: 10),
                      Container(
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
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
