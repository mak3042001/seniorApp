import 'package:flutter/material.dart';
import 'package:senior/app/IconBroken.dart';
import 'package:senior/domain/model/model.dart';
import '../../../app/di.dart';
import '../../common/state_renderer/state_renderer__impl.dart';
import '../user_viewModel/user_viewModel.dart';


class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _searchController = TextEditingController();
  String item = "";
  final UserViewModel _viewModel = instance<UserViewModel>();

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
    );
  }

  Widget _getContentWidget() {
    return StreamBuilder<UserUser>(
      stream: _viewModel.outputUser,
      builder: (context, snapshot) {
        return _getItem(snapshot.data);
      },
    );
  }

  Widget _getItem(UserUser? user) {
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
              itemBuilder: (context, index) => StreamBuilder<UserUser>(
                stream: _viewModel.outputUser,
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
      BuildContext context, int i, UserUser? user) {
    if (user != null && user.data![i]!.name.contains(item)) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 70,
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
              Text(
                user.data![i]!.name,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(fontSize: 30),
              ),
            ],
          ),
        ),
      );
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
