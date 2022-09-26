// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AppUser {
  final String? email;
  final String userName;
  final bool isOnline;
  final String? lastSeen;
  AppUser({
    this.email,
    required this.userName,
    required this.isOnline,
    this.lastSeen,
  });

  AppUser copyWith({
    String? email,
    String? userName,
    bool? isOnline,
    String? lastSeen,
  }) {
    return AppUser(
      email: email ?? this.email,
      userName: userName ?? this.userName,
      isOnline: isOnline ?? this.isOnline,
      lastSeen: lastSeen ?? this.lastSeen,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'userName': userName,
      'isOnline': isOnline,
      'lastSeen': lastSeen,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      email: map['email'] != null ? map['email'] as String : null,
      userName: map['userName'] as String,
      isOnline: map['isOnline'] as bool,
      lastSeen: map['lastSeen'] != null ? map['lastSeen'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AppUser(email: $email, userName: $userName, isOnline: $isOnline, lastSeen: $lastSeen)';
  }

  @override
  bool operator ==(covariant AppUser other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.userName == userName &&
        other.isOnline == isOnline &&
        other.lastSeen == lastSeen;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        userName.hashCode ^
        isOnline.hashCode ^
        lastSeen.hashCode;
  }
}
