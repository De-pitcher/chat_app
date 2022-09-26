import 'package:chat_app/views/chats_page.dart';
import 'package:chat_app/views/sign_in_page.dart';
import 'package:chat_app/views/sign_up_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SignUpPage.id:
      return MaterialPageRoute(builder: (_) => const SignUpPage());
    case SignInPage.id:
      return MaterialPageRoute(builder: (_) => const SignInPage());
    case ChatsPage.id:
      return MaterialPageRoute(builder: (_) => const ChatsPage());
    default:
      throw ('This route name does not exit');
  }
}
