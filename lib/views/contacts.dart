import 'package:chat_app/common/common.dart';
import 'package:chat_app/common/widgets/contact_tile.dart';
import 'package:chat_app/models/model.dart';
import 'package:chat_app/view_model/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class Contacts extends ConsumerStatefulWidget {
  static const String id = '/contacts';
  const Contacts({super.key});

  @override
  ConsumerState<Contacts> createState() => _ContactsState();
}

class _ContactsState extends ConsumerState<Contacts> {
  Contact? currentUser;
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
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            StreamBuilder(
              stream: ref
                  .watch(databaseProvider)
                  .database
                  .ref()
                  .child('contacts')
                  .onValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.blueColor,
                    ),
                  );
                }
                if (snapshot.hasData) {
                  final userId = ref
                      .watch(appFirebaseAuthProvider)
                      .userSharedPreference
                      .userId;
                  Map<dynamic, dynamic>? data =
                      snapshot.data?.snapshot.value as Map<dynamic, dynamic>;
                  for (var element in data.entries) {
                    if (element.key == userId) {
                      currentUser = Contact(
                          email: element.value['email'],
                          userName: element.value['userName'],
                          imageUrl: element.value['imageUrl'],
                          lastMessage: '',
                          isOnline: true,
                          lastSeen: DateTime.now());
                    }
                  }
                  ref
                      .watch(databaseProvider)
                      .updateUserState(userId, currentUser!)
                      .listen((event) {});
                  data.removeWhere((key, value) => key == userId);
                  return ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * .6),
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      children: data.entries.map((e) {
                        return Column(
                          children: [
                            ContactTile(
                                contact: Contact(
                                    email: e.value['email'],
                                    userName: e.value['userName'],
                                    imageUrl: e.value['imageUrl'],
                                    lastSeen: e.value['lastSeen'] != '' ||
                                            e.value['lastSeen'] != null
                                        ? DateTime.fromMillisecondsSinceEpoch(
                                            e.value['lastSeen'])
                                        : DateTime.now(),
                                    lastMessage: 'lastMessage',
                                    isOnline: e.value['isOnline'])),
                            const Divider(),
                          ],
                        );
                        // return Container();
                      }).toList(),
                    ),
                  );
                }
                return const Text('Something Went Wrong!');
              },
            )
          ],
        ),
      ),
    );
  }
}
