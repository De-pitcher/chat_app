import 'package:chat_app/common/avatar.dart';
import 'package:chat_app/screens/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/static_data.dart';
import '../utils/utils.dart';

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
          arguments: widget.contact.name),
      leading: Avatar(imageUrl: widget.contact.image, isOnline: true),
      title: Text(
        widget.contact.name,
        style: GoogleFonts.mulish(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColor.blackColor),
      ),
      subtitle: Text(
        widget.contact.onlineStatus,
        style: GoogleFonts.mulish(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColor.greyColor),
      ),
    );
  }
}
