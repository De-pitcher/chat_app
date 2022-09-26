import 'package:chat_app/models/model.dart';

abstract class AuthRepo {
  Future createUser(
      String email, String password, bool isOnline, String lastSeen);

  Future<AppUser> signIn(String email, String password);

  Future updateStatus(bool isOnline);

  // Future signOut();
}
