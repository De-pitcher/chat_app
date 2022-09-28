import 'package:chat_app/common/common.dart';
import 'package:chat_app/models/model.dart';
import 'package:chat_app/screens/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';

class ContactTile extends StatefulWidget {
  final Contact contact;
  const ContactTile({super.key, required this.contact});

  @override
  State<ContactTile> createState() => _ContactTileState();
}

class _ContactTileState extends State<ContactTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      onTap: () => Navigator.pushNamed(context, ChatRoom.id,
          arguments: widget.contact.userName),
      leading: SizedBox(
        height: 56,
        width: 56,
        child: Avatar(
          imageUrl: widget.contact.imageUrl,
          isOnline: widget.contact.isOnline,
          isNetwork: true,
        ),
      ),
      title: Text(
        widget.contact.userName,
        style: GoogleFonts.mulish(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColor.blackColor),
      ),
      subtitle: Text(
        widget.contact.isOnline ? 'Online' : Jiffy(widget.contact.lastSeen).fromNow(),
        style: GoogleFonts.mulish(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColor.greyColor),
      ),
    );
  }
}
