//import 'package:chat_app/main.dart';
import 'package:chat_app/domain/entities/message.dart';
import 'package:chat_app/presentation/providers/chat_provider.dart';
import 'package:chat_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:chat_app/presentation/widgets/chat/vegeta_massage_bubble.dart';
import 'package:chat_app/presentation/widgets/shared/message_field_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(3.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.squarespace-cdn.com/content/v1/5616ac17e4b018d366f57f53/1617624960316-A1KDJP324PYQISDAKQF7/Vegeta+Soundboard?format=2500w'),
          ),
        ),
        title: const Text('Vegeta'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messageList[index];
                      return (message.fromWho == FromWho.to)
                          ? ToMessageBubble(message: message)
                          : MyMessageBubble(message: message);
                    })),
            //Caja de texto
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
