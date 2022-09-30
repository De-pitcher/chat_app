import 'package:chat_app/models/text_message.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatMessageProvider =
    StateNotifierProvider<ChatControllerNotifier, List<TextMessage>>((ref) {
  return ChatControllerNotifier();
});

class ChatControllerNotifier extends StateNotifier<List<TextMessage>> {
  ChatControllerNotifier() : super([]);

  void sendMessage(TextMessage msg) {
    state = [...state, msg];
  }

  void deleteMessage() {
    state.clear();
  }
}
