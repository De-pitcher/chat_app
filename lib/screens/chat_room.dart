import 'package:chat_app/common/common.dart';
import 'package:chat_app/screens/chats_page.dart';
import 'package:chat_app/screens/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatRoom extends StatefulWidget {
  final String chatGuest;
  static const String id = '/chat_room';
  const ChatRoom({super.key, required this.chatGuest});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  List<PopupMenuItem> items = const [
    PopupMenuItem(
      value: 'Do sth',
      child: Text('Do sth'),
    ),
    PopupMenuItem(
      value: 'Do sth',
      child: Text('Do sth'),
    ),
    PopupMenuItem(
      value: 'Do sth',
      child: Text('Do sth'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          
          },
          icon: const Icon(Icons.navigate_before_rounded),
          color: AppColor.blackColor,
        ),
        leadingWidth: 32,
        title: Text(
          widget.chatGuest,
          style: GoogleFonts.mulish(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColor.blackColor),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: AppColor.blackColor,
          ),
          PopupMenuButton(
            itemBuilder: (context) => items,
            icon: const Icon(
              Icons.menu,
              color: AppColor.blackColor,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}
