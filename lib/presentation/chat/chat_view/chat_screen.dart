import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../domain/model/real_time_message.dart';

class ChatScreen extends StatefulWidget {
  final int senderId;
  final int receiverId;

  ChatScreen({required this.senderId, required this.receiverId});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final DatabaseReference _databaseRef = FirebaseDatabase.instance.ref();
  final TextEditingController _messageController = TextEditingController();
  late int _currentUserId;
  late String _senderRoom;
  late String _receiverRoom;
  List<RealTimeMessage> _messagesList = [];

  @override
  void initState() {
    super.initState();
    _currentUserId = widget.senderId;
    _senderRoom = '$_currentUserId${widget.receiverId}';
    _receiverRoom = '${widget.receiverId}$_currentUserId';
    getRealTimeMessages();
  }

  void sendRealTimeMessage() {
    String message = _messageController.text;
    RealTimeMessage messageObject =
    RealTimeMessage(message: message, senderId: _currentUserId, id: Random().nextInt(999999));

    _databaseRef.child("chats").child(_senderRoom).child("messages").push().set(messageObject.toJson());
    _databaseRef.child("chats").child(_receiverRoom).child("messages").push().set(messageObject.toJson());

    _messageController.clear();
  }

  void getRealTimeMessages() {
    _databaseRef
        .child("chats")
        .child(_senderRoom)
        .child("messages")
        .onValue
        .listen((event) {
      List<RealTimeMessage> messages = [];
      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> data = (event.snapshot.value as Map<dynamic, dynamic>);
        data.forEach((key, value) {
          messages.add(RealTimeMessage.fromJson(value));
        });
      }
      setState(() {
        _messagesList = messages;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Screen"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messagesList.length,
              itemBuilder: (context, index) {
                RealTimeMessage message = _messagesList[index];
                return ListTile(
                  title: Text(message.message),
                  subtitle: Text("${message.senderId}"),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(hintText: "Enter message"),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: sendRealTimeMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
