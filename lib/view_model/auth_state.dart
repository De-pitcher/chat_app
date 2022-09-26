import 'package:chat_app/common/common.dart';
import 'package:chat_app/models/model.dart';
import 'package:chat_app/views/sign_up_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInNotifier extends StateNotifier<AsyncValue<AppUser?>> {
  SignInNotifier({required this.appFirebaseAuth})
      : super(const AsyncValue.data(null));
  final AppFirebaseAuth appFirebaseAuth;

  Future signIn(String email, String password, BuildContext context) async {
    try {
      state = const AsyncValue.loading();
      final response = await appFirebaseAuth.signIn(email, password);
      state = AsyncValue.data(response);
    } on FirebaseAuthException catch (error) {
      state = AsyncValue.error(error.message!);
    } catch (error) {
      state = AsyncValue.error(error);
    }
  }
}

class SignUpNotifier extends StateNotifier<AsyncValue<void>> {
  SignUpNotifier({required this.appFirebaseAuth})
      : super(const AsyncValue.data(null));
  final AppFirebaseAuth appFirebaseAuth;
  Future createUser(String email, String password, BuildContext context) async {
    try {
      state = const AsyncValue.loading();
      await appFirebaseAuth.createUser(
          email, password, false, DateTime.now().toString());
      state = const AsyncValue.data(null);
    } on FirebaseAuthException catch (error) {
      if (kDebugMode) print(error);
      state = AsyncValue.error(error.message as Object);
    }
  }
}

final appFirebaseAuthProvider = Provider<AppFirebaseAuth>((ref) {
  return AppFirebaseAuth(ref.watch(databaseProvider));
});
final databaseProvider = Provider<Database>((ref) {
  return Database();
});

final signInStateProvider =
    StateNotifierProvider<SignInNotifier, AsyncValue<AppUser?>>((ref) {
  final appFirebaseAuth = ref.watch(appFirebaseAuthProvider);
  return SignInNotifier(appFirebaseAuth: appFirebaseAuth);
});

final signUpStateProvider =
    StateNotifierProvider<SignUpNotifier, AsyncValue<void>>((ref) {
  final appFirebaseAuth = ref.watch(appFirebaseAuthProvider);
  return SignUpNotifier(appFirebaseAuth: appFirebaseAuth);
});

final updateStatusProvider = Provider.family<void, bool>((ref, isOnline) async {
  final appFirebaseAuth = ref.watch(appFirebaseAuthProvider);
  return await appFirebaseAuth.updateStatus(isOnline);
});
