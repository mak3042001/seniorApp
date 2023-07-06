import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../../../app/IconBroken.dart';
import '../../../app/static.dart';
import '../../../domain/model/model.dart';

class ChatScreen extends StatefulWidget {
  int receiverId;

  ChatScreen(this.receiverId, {super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState(receiverId);
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _sendController = TextEditingController();
  int receiverId;

  _ChatScreenState(this.receiverId);

  final firebase = FirebaseDatabase.instance.ref('chats');

  send(int senderId, int receiverId, String message) async {
    await firebase
        .child('$senderId$receiverId')
        .child('messages')
        .push()
        .set({
          "id": Random().nextInt(999999),
          "message": message,
          "senderId": senderId,
        })
        .then((value) => firebase
                .child('$receiverId$senderId')
                .child('messages')
                .push()
                .set({
              "id": Random().nextInt(999999),
              "message": message,
              "senderId": senderId,
            }))
        .catchError((e) {
          print("firebase error is ${e.toString()}");
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff283DAA),
        title: const Text('chat screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 500,
              child: Column(
                children: [
                  Expanded(
                      child: FirebaseAnimatedList(
                    query: firebase.child('58$receiverId').child('messages'),
                    itemBuilder: (context , snapshot , animation , index){
                      return snapshot.child('senderId').value == 58 ?
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: Container(
                            color: Colors.green,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(snapshot.child('message').value.toString()),
                            ),
                          ),
                        ),
                      )
                          :
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Container(
                            color: Colors.blue,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(snapshot.child('message').value.toString()),
                            ),
                          ),
                        ),
                      );
                    },
                  ))
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: defaultFormField(
                    controller: _sendController,
                    type: TextInputType.text,
                    text: 'Description',
                    prefix: IconBroken.Document,
                    isPassword: false,
                  ),
                ),
                CircleAvatar(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        send(58, receiverId, _sendController.text);
                        _sendController.text = "";
                      });
                    },
                    child: const Icon(IconBroken.Send),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
