import 'package:chat_app/screens/chat_room.dart';
import 'package:flutter/material.dart';

import 'common/bottom_nav_view.dart';
import 'screens/chats_page.dart';
import 'screens/contacts.dart';
import 'screens/search.dart';
import 'screens/user.dart';
import 'utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat',
      initialRoute: ParentView.id,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case ParentView.id:
            return MaterialPageRoute(builder: (_) => const ParentView());
          case Contacts.id:
            return MaterialPageRoute(builder: (_) => const Contacts());
          case ChatsPage.id:
            return MaterialPageRoute(builder: (_) => const ChatsPage());
          case Search.id:
            return MaterialPageRoute(builder: (_) => const Search());
          case User.id:
            return MaterialPageRoute(builder: (_) => const User());
          case ChatRoom.id:
            final args = settings.arguments as String;
            return MaterialPageRoute(builder: (_) => ChatRoom(chatGuest: args));
          default:
        }
        return null;
      },
      debugShowCheckedModeBanner: false,
      theme: theme,
    );
  }
}
