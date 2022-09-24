// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/core/constant.dart';
import 'package:chat_app/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chat_app/common/common.dart';

class ChatsPage extends StatefulWidget {
  static const String id = '/recent_chats';
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  final ScrollController _controller = ScrollController();
  // int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chats',
          style: Theme.of(context).textTheme.headline1,
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/notification.svg'),
                const SizedBox(width: 10),
                const Icon(
                  Icons.notifications_none,
                  color: Colors.black,
                )
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
              height: 108,
              width: MediaQuery.of(context).size.width,
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                }),
                child: ListView.separated(
                    controller: _controller,
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final users = usersList[index];
                      return UserAvatar(
                        userName: users.userName,
                        imageUrl: users.imageUrl,
                        isOnline: users.isOnline,
                        numberOfUnreadMessage: users.numberOfUnreadMessage,
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 15),
                    itemCount: usersList.length),
              )),
          ChatTile(
            imageUrl: usersList[1].imageUrl,
            userName: usersList[1].userName,
            isOnline: usersList[1].isOnline,
            lastMessage: 'Good morning? did you sleep well?',
            lastSeen: '3m ago',
            numberOfUnreadMessage: 2,
          )
        ],
      ),
      // bottomNavigationBar: BottomBarNav(),
    );
  }
}
