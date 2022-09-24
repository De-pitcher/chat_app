import 'package:chat_app/common/contact_tile.dart';

import 'package:chat_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chat_app/core/static_data.dart';

class Contacts extends StatefulWidget {
  static const String id = '/contacts';
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 24, right: 24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Contacts',
                        style: GoogleFonts.mulish(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColor.blackColor),
                      ),
                      const Icon(Icons.add)
                    ],
                  ),
                  const SizedBox(height: 28),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search',
                      filled: true,
                      fillColor: const Color.fromRGBO(247, 247, 252, 1),
                      hintStyle: GoogleFonts.mulish(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColor.greyColor),
                      border: const OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                  const SizedBox(height: 20),
                 
                ],
              ),
            ),
             ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * .6),
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemBuilder: (context, index) {
                  return ContactTile(contact: mockListOfContacts[index]);
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: 4,
              ),
            )
          ],
        ),
      ),
    );
  }
}
