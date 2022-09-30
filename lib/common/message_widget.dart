import 'package:chat_app/models/text_message.dart';
import 'package:chat_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageWidget extends StatelessWidget {
  final TextMessage message;
  final bool isMe;
  const MessageWidget({super.key, required this.message, this.isMe = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
             
          padding: const EdgeInsets.all(10),
          decoration: isMe
              ? const BoxDecoration(
                  color: Color.fromRGBO(0, 45, 227, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(0),
                  ),
                )
              : const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(16),
                  ),
                ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    message.message,
                               
                  
                    style: isMe
                        ? GoogleFonts.mulish(fontSize: 14, color: Colors.white)
                        : GoogleFonts.mulish(
                            fontSize: 14, color: AppColor.blackColor),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment:
                    isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  Text(
                    message.timeSent.format(context),
                    style: isMe
                        ? GoogleFonts.lato(fontSize: 10, color: Colors.white)
                        : GoogleFonts.lato(
                            fontSize: 10, color: AppColor.greyColor),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
