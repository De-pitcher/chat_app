import 'package:chat_app/common/message_widget.dart';
import 'package:chat_app/models/text_message.dart';
import 'package:chat_app/utils/providers/chat_provider.dart';
import 'package:chat_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatRoom extends ConsumerStatefulWidget {
  final String chatGuest;
  static const String id = '/chat_room';
  const ChatRoom({super.key, required this.chatGuest});

  @override
  ConsumerState<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends ConsumerState<ChatRoom> {
  final chatController = TextEditingController();
  bool highlighted = false;

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
  void dispose() {
    chatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(chatMessageProvider);
    final msgAction = ref.read(chatMessageProvider.notifier);
    return Scaffold(
      backgroundColor: const Color(0XFFE5E5E5),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
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
        actions: highlighted
            ? [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                  color: AppColor.blueColor,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.library_add),
                  color: AppColor.blueColor,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.keyboard_double_arrow_right),
                  color: AppColor.blueColor,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.star),
                  color: AppColor.blueColor,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete),
                  color: AppColor.blueColor,
                )
              ]
            : [
                IconButton(
                  onPressed: () {
                    messages.clear();
                  },
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
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() => highlighted = false);
                  },
                  onLongPress: () {
                    setState(() => highlighted = true);
                  },
                  child: Container(
                    foregroundDecoration: BoxDecoration(
                        color: highlighted
                            ? AppColor.blueColor.withOpacity(.15)
                            : null),
                    child: MessageWidget(message: messages[index], ),
                  ),
                );
              },
              separatorBuilder: (context, _) {
                return const SizedBox(height: 12);
              },
              itemCount: messages.length,
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                ),
                Expanded(
                  child: TextField(
                    controller: chatController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromRGBO(247, 247, 247, 1),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 8),
                      constraints: const BoxConstraints(maxHeight: 36),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    ref
                        .read(chatMessageProvider.notifier)
                        .sendMessage(TextMessage(message: chatController.text));
                    chatController.clear();
                  },
                  icon: const Icon(Icons.send),
                  color: AppColor.blueColor,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
