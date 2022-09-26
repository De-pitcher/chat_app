// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Contact {
  final String email;
  final String userName;
  final String imageUrl;
  final String lastMessage;
  final bool isOnline;
  final DateTime? lastSeen;
  Contact({
    required this.email,
    required this.userName,
    required this.imageUrl,
    required this.lastMessage,
    required this.isOnline,
    this.lastSeen,
  });

  Contact copyWith({
    String? email,
    String? userName,
    String? imageUrl,
    String? lastMessage,
    bool? isOnline,
    DateTime? lastSeen,
  }) {
    return Contact(
      email: email ?? this.email,
      userName: userName ?? this.userName,
      imageUrl: imageUrl ?? this.imageUrl,
      lastMessage: lastMessage ?? this.lastMessage,
      isOnline: isOnline ?? this.isOnline,
      lastSeen: lastSeen ?? this.lastSeen,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'userName': userName,
      'imageUrl': imageUrl,
      'lastMessage': lastMessage,
      'isOnline': isOnline,
      'lastSeen': lastSeen?.millisecondsSinceEpoch,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      email: map['email'] as String,
      userName: map['userName'] as String,
      imageUrl: map['imageUrl'] as String,
      lastMessage: map['lastMessage'] as String,
      isOnline: map['isOnline'] as bool,
      lastSeen: map['lastSeen'] != null ? DateTime.fromMillisecondsSinceEpoch(map['lastSeen'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Contact.fromJson(String source) => Contact.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Contact(email: $email, userName: $userName, imageUrl: $imageUrl, lastMessage: $lastMessage, isOnline: $isOnline, lastSeen: $lastSeen)';
  }

  @override
  bool operator ==(covariant Contact other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.userName == userName &&
      other.imageUrl == imageUrl &&
      other.lastMessage == lastMessage &&
      other.isOnline == isOnline &&
      other.lastSeen == lastSeen;
  }

  @override
  int get hashCode {
    return email.hashCode ^
      userName.hashCode ^
      imageUrl.hashCode ^
      lastMessage.hashCode ^
      isOnline.hashCode ^
      lastSeen.hashCode;
  }
}
