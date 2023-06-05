import 'package:flutter/material.dart';
import 'package:senior/app/IconBroken.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/presentation/contact/contactScreen.dart';
import 'package:senior/presentation/notification/notification_viewModel/notification_viewModel.dart';
import 'package:senior/presentation/profile/profileScreen.dart';
import '../../../app/di.dart';
import '../../common/state_renderer/state_renderer__impl.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final NotificationViewModel _viewModel = instance<NotificationViewModel>();

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
        title: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ContactsScreen()));
            },
            child: const Text(
              "Contacts",
              style: TextStyle(color: Colors.grey),
            )),
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
            onPressed: () {},
            icon: const Icon(
              IconBroken.Notification,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
            icon: const Icon(
              IconBroken.Profile,
              color: Colors.grey,
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
    return StreamBuilder<NotificationIndex>(
      stream: _viewModel.outputNotification,
      builder: (context, snapshot) {
        return _getItem(snapshot.data);
      },
    );
  }

  Widget _getItem(NotificationIndex? notificationIndex) {
    if (notificationIndex != null) {
      return ListView.separated(
        itemBuilder: (context, index) => StreamBuilder<NotificationIndex>(
          stream: _viewModel.outputNotification,
          builder: (context, snapshot) {
            return _matrialList(context, index, snapshot.data);
          },
        ),
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey[600],
          height: 5.0,
        ),
        itemCount: notificationIndex.data.length,
      );
    } else {
      return Container();
    }
  }

  Widget _matrialList(
      BuildContext context, int i, NotificationIndex? notification) {
    if (notification != null) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${notification.data[i]?.title}",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 30),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "${notification.data[i]?.content}",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
