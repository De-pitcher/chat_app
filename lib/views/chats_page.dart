// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/models/model.dart';
import 'package:chat_app/view_model/auth_state.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chat_app/common/common.dart';

class ChatsPage extends ConsumerStatefulWidget {
  static const id = 'chatPage';
  const ChatsPage({super.key});

  @override
  ConsumerState<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends ConsumerState<ChatsPage> {
  Contact? currentUser;
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
        body: StreamBuilder<DatabaseEvent?>(
          stream: ref
              .watch(databaseProvider)
              .database
              .ref()
              .child('contacts')
              .onValue,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container();
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
              data.removeWhere((key, value) => key == userId);
              List<Widget> contacts = [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: const [
                      UserAvatar(
                        userName: 'Pin Favorite',
                        imageUrl: null,
                        isOnline: false,
                        numberOfUnreadMessage: 0,
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                ...data.entries.map((e) {
                  return FutureBuilder(
                      future:
                          ref.watch(databaseProvider).getProfileImage(e.key),
                      builder: (context, snapshot) {
                        return Row(
                          children: [
                            UserAvatar(
                              userName: e.value['userName'],
                              imageUrl: snapshot.data,
                              isOnline: e.value['isOnline'],
                              numberOfUnreadMessage: 0,
                            ),
                            const SizedBox(width: 10),
                          ],
                        );
                      });
                })
              ];
              return Column(
                children: [
                  SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: contacts,
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: data.entries
                          .map((e) => FutureBuilder(
                              future: ref
                                  .watch(databaseProvider)
                                  .getProfileImage(e.key),
                              builder: (context, snapshot) {
                                return InkWell(
                                    onTap: () => ref
                                        .watch(databaseProvider)
                                        .updateUserState(userId, currentUser!),
                                    child: ChatTile(
                                      userName: e.value['userName'],
                                      imageUrl: snapshot.data,
                                    ));
                              }))
                          .toList(),
                    ),
                  ),
                ],
              );
            }
            return const UserAvatar(
                userName: 'Pin Favorite',
                numberOfUnreadMessage: 0,
                isOnline: false);
          },
        ),

        // StreamBuilder(
        //     stream: ref
        //         .watch(databaseProvider)
        //         .database
        //         .ref()
        //         .child('contacts')
        //         .onValue,
        //     builder: (context, snapshot) {
        //       if (snapshot.hasData) {
        //         final userId = ref
        //             .watch(appFirebaseAuthProvider)
        //             .userSharedPreference
        //             .userId;
        //         Map<dynamic, dynamic>? data =
        //             snapshot.data?.snapshot.value as Map<dynamic, dynamic>;
        //         data.removeWhere((key, value) => key == userId);
        //         return Expanded(
        //           child: ListView(
        //             children: data.entries
        //                 .map((e) => ChatTile(userName: e.value['userName']))
        //                 .toList(),
        //           ),
        //         );
        //       }
        //       return Container();
        //     })
        // ],

        bottomNavigationBar: const BottomBarNav());
  }
}
