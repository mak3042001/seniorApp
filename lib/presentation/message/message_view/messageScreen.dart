import 'package:flutter/material.dart';
import 'package:senior/app/IconBroken.dart';
import 'package:senior/app/app_preference.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/presentation/resources/color_manager.dart';
import '../../../app/di.dart';
import '../../chat/chat_view/chat_view.dart';
import '../../common/state_renderer/state_renderer__impl.dart';
import '../../resources/routes_manager.dart';
import '../message_viewModel/message_viewModel.dart';


class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final AppPreference _appPreference = instance<AppPreference>();
  final TextEditingController _searchController = TextEditingController();
  String item = "";
  final MessageViewModel _viewModel = instance<MessageViewModel>();

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
        backgroundColor: const Color(0xff283DAA),
        title: const Text(
          "Chat",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            IconBroken.Arrow___Left_2,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              (){_viewModel.start();}.call();
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          ),
        ],
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
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, Routes.userScreen);
        },
        child: const Icon(
          IconBroken.Message,
        ),
      ),
    );
  }

  Widget _getContentWidget() {
    return StreamBuilder<MessageIndex>(
      stream: _viewModel.outputMessage,
      builder: (context, snapshot) {
        return _getItem(snapshot.data);
      },
    );
  }

  Widget _getItem(MessageIndex? user) {
    if (user != null) {
      return Column(
        children: [
          const SizedBox(
            height: 10.0,
          ),
          TextField(
            controller: _searchController,
            onChanged: (value){
              setState(() {
                item = value;
              });
            },
            decoration: const InputDecoration(
              labelText: 'Search',
              prefixIcon: Icon(Icons.search),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => StreamBuilder<MessageIndex>(
                stream: _viewModel.outputMessage,
                builder: (context, snapshot) {
                  return _matrialList(context, index, snapshot.data);
                },
              ),
              itemCount: user.data!.length,
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget _matrialList(
      BuildContext context, int i, MessageIndex? user) {
    if (user != null) {
      if(user.data![i]!.name.contains(item) || user.data![i]!.username.contains(item)){
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChatScreen(user.data![i]!.id)));
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(user.data![i]!.image),
                        radius: 35,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.data![i]!.name,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(fontSize: 30 , color:  ColorManager.black , fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            user.data![i]!.username,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontSize: 20 , color:  ColorManager.grey , fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }else{
        return Container();
      }
    } else {
      return Container();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _viewModel.dispose();
  }
}
