import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:senior/app/di.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/presentation/chat/chat_view_model/chat_view_model.dart';
import 'package:senior/presentation/resources/color_manager.dart';

import '../../../app/IconBroken.dart';
import '../../../app/static.dart';
import '../../common/state_renderer/state_renderer__impl.dart';

class ChatScreen extends StatefulWidget {
  String image;
  String name;
  int receiverId;


  ChatScreen(this.image, this.name, this.receiverId, {super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState(receiverId , name , image);
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatViewModel _viewModel = instance<ChatViewModel>();

  final TextEditingController _sendController = TextEditingController();
  String image;
  String name;
  int receiverId;

  _ChatScreenState(this.receiverId , this.name , this.image);

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
  void initState() {
    bind();
    super.initState();
  }

  bind() {
    _viewModel.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            IconBroken.Arrow___Left_2,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff283DAA),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                image,
              ),
              // radius: 65.0,
            ),
            const SizedBox(width: 10.0,),
            Text(name ,style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return Container(
            child:
            snapshot.data?.getScreenWidget(context, _getContentWidget(), () {
              _viewModel.start();
            }) ??
                Container(),
          );
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return StreamBuilder<Profile>(
      stream: _viewModel.outputProfile,
      builder: (context, snapshot) {
        return _getItem(snapshot.data);
      },
    );
  }

  Widget _getItem(Profile? profile) {
    if (profile != null) {
      return Column(
        children: [
          Expanded(
            flex: 100,
            child: FirebaseAnimatedList(
              query: firebase.child('${profile.data!.id}$receiverId').child('messages'),
              itemBuilder: (context , snapshot , animation , index){
                return snapshot.child('senderId').value == 58 ?
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(snapshot.child('message').value.toString() ,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: ColorManager.white,
                          ),
                        ),
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
                      decoration: BoxDecoration(
                          color: Colors.grey[500],
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(snapshot.child('message').value.toString() ,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: ColorManager.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: defaultFormField(
                    controller: _sendController,
                    type: TextInputType.text,
                    text: 'Message',
                    prefix: IconBroken.Message,
                    isPassword: false,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        send(profile.data!.id, receiverId, _sendController.text);
                        _viewModel.send(profile.data!.id , receiverId , _sendController.text);
                        _sendController.text = "";
                      });
                    },
                    child: const Icon(IconBroken.Send),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }

}
