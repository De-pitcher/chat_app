import 'package:chat_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class User extends StatefulWidget {
  static const id = '/user';
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  bool chatClicked = true;
  bool groupClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Profile',
                        style: GoogleFonts.mulish(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColor.blackColor),
                      ),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
                    ],
                  ),
                  // AssetImage()
                  Text(
                    'Victoria Robertson',
                    style: GoogleFonts.mulish(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: AppColor.blackColor),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'A mantra goes here',
                    style: GoogleFonts.mulish(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(164, 164, 164, 1),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '+ 99 99999 00000',
                    style: GoogleFonts.mulish(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(44, 55, 225, 1),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromRGBO(237, 237, 237, 1)),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              if (groupClicked != false &&
                                  chatClicked != true) {
                                setState(() {
                                  chatClicked = true;
                                  groupClicked = false;
                                });
                              }
                            },
                            style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 14, horizontal: 60),
                                backgroundColor: chatClicked
                                    ? const Color.fromRGBO(255, 255, 255, 1)
                                    : Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            child: Text(
                              'Chat',
                              style: GoogleFonts.mulish(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: chatClicked
                                    ? const Color.fromRGBO(44, 55, 225, 1)
                                    : const Color.fromRGBO(164, 164, 164, 1),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              if (groupClicked != true &&
                                  chatClicked != false) {
                                setState(() {
                                  chatClicked = false;
                                  groupClicked = true;
                                });
                              }
                            },
                            style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 14, horizontal: 60),
                                backgroundColor: groupClicked
                                    ? const Color.fromRGBO(255, 255, 255, 1)
                                    : Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            child: Text(
                              'Group',
                              style: GoogleFonts.mulish(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: groupClicked
                                      ? const Color.fromRGBO(44, 55, 225, 1)
                                      : const Color.fromRGBO(164, 164, 164, 1)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
