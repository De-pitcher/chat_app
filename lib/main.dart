import 'dart:async';
import 'package:chat_app/common/common.dart';
import 'package:chat_app/routes.dart';
import 'package:chat_app/views/sign_up_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // ConnectionUtil connectionStatus = ConnectionUtil.getInstance();
  // connectionStatus.initialize();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: theme,
      onGenerateRoute: generateRoute,
      home: const SignUpPage(),
    );
  }
}
