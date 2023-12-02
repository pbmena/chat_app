import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:chat_app/services/chat/chat_service.dart';
import 'package:chat_app/ui/constants/constants.dart';
import 'package:chat_app/ui/utils/utils.dart';
import 'package:chat_app/ui/view/chat/components/chat_bubble.dart';
import 'package:chat_app/components/text_field.dart';

class ChatPage extends StatefulWidget {
  final String? receiverUserEmail;
  final String? receiverUserID;
  const ChatPage({
    super.key,
    this.receiverUserEmail,
    this.receiverUserID,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
        widget.receiverUserID ?? "",
        _messageController.text,
      );
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverUserEmail.toString().split("@").first),
        titleTextStyle: kcHeaderStyle,
      ),
      body: Column(
        children: [
          Expanded(child: _buildMessageList()),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    return StreamBuilder(
        stream: _chatService.getMessages(
          widget.receiverUserID ?? "",
          _firebaseAuth.currentUser!.uid,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('${TxtConstant.errorTxt}${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text(TxtConstant.loadingTxt);
          }

          return ListView(
            children: snapshot.data!.docs
                .map((document) => _buildMessageItem(document))
                .toList(),
          );
        });
  }

  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    DateTime dt = (data['timestamp'] as Timestamp).toDate();
    var date = DateFormat('E d, HH:mm').format(dt);

    var currentData = (data['senderId'] == _firebaseAuth.currentUser!.uid);

    var alignment = currentData ? Alignment.centerRight : Alignment.centerLeft;

    var crossAlign =
        currentData ? CrossAxisAlignment.end : CrossAxisAlignment.start;

    var crossStartAlign =
        currentData ? CrossAxisAlignment.start : CrossAxisAlignment.start;

    var mainAlign =
        currentData ? MainAxisAlignment.end : MainAxisAlignment.start;

    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
        child: Column(
          crossAxisAlignment: crossAlign,
          mainAxisAlignment: mainAlign,
          children: [
            Row(
              crossAxisAlignment: crossStartAlign,
              mainAxisAlignment: mainAlign,
              children: [
                Flexible(
                  flex: 3,
                  child: ChatBubble(
                    message: data['message'],
                    color: (data['senderId'] == _firebaseAuth.currentUser!.uid)
                        ? AppColors.kcMessageSentBg
                        : AppColors.kcMessageReceivedBg,
                  ),
                ),
                Flexible(
                  child: Transform(
                    transform: Matrix4.identity()..scale(0.8),
                    alignment: Alignment.topRight,
                    child: Chip(
                      label: Text(
                        data['senderEmail']
                            .toString()
                            .substring(0, 1)
                            .toUpperCase(),
                        style: kcChipLabelStyle,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(color: AppColors.kcNoBg),
                      ),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      backgroundColor:
                          (data['senderId'] == _firebaseAuth.currentUser!.uid)
                              ? AppColors.kcMessageSentBg
                              : AppColors.kcMessageReceivedBg,
                      padding: const EdgeInsets.all(3.0),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Padding(
              padding: (data['senderId'] == _firebaseAuth.currentUser!.uid)
                  ? const EdgeInsets.symmetric(horizontal: 40)
                  : const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                date.toString(),
                style: kcDateStyle,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return SafeArea(
      child: Padding(
        padding: keSymLarge,
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: MyTextField(
                controller: _messageController,
                hintText: TxtConstant.cHintTxt,
                obscureText: false,
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: sendMessage,
                icon: const Icon(
                  Icons.arrow_circle_right,
                  size: 50,
                  color: AppColors.kcPrimaryBtn,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
