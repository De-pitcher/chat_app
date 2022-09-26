// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Message {
  final String email;
  final String message;
  final bool isRead;
  final DateTime timestamp;
  Message({
    required this.email,
    required this.message,
    required this.isRead,
    required this.timestamp,
  });

  Message copyWith({
    String? email,
    String? message,
    bool? isRead,
    DateTime? timestamp,
  }) {
    return Message(
      email: email ?? this.email,
      message: message ?? this.message,
      isRead: isRead ?? this.isRead,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'message': message,
      'isRead': isRead,
      'timestamp': timestamp.millisecondsSinceEpoch,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      email: map['email'] as String,
      message: map['message'] as String,
      isRead: map['isRead'] as bool,
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Message(email: $email, message: $message, isRead: $isRead, timestamp: $timestamp)';
  }

  @override
  bool operator ==(covariant Message other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.message == message &&
      other.isRead == isRead &&
      other.timestamp == timestamp;
  }

  @override
  int get hashCode {
    return email.hashCode ^
      message.hashCode ^
      isRead.hashCode ^
      timestamp.hashCode;
  }
}
