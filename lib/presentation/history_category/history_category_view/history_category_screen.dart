import 'package:flutter/material.dart';
import 'package:senior/app/IconBroken.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/presentation/history_category/history_category_viewModel/history_category_viewModel.dart';
import '../../../app/di.dart';
import '../../common/state_renderer/state_renderer__impl.dart';


class HistoryCategoriesScreen extends StatefulWidget {
  const HistoryCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<HistoryCategoriesScreen> createState() => _HistoryCategoriesScreenState();
}

class _HistoryCategoriesScreenState extends State<HistoryCategoriesScreen> {
  final HistoryCategoriesViewModel _viewModel = instance<HistoryCategoriesViewModel>();

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
          "History Categories",
          style: TextStyle(color: Colors.grey),
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
    return StreamBuilder<HistoryCategoriesIndex>(
      stream: _viewModel.outputHistoryCategories,
      builder: (context, snapshot) {
        return _getItem(snapshot.data);
      },
    );
  }

  Widget _getItem(HistoryCategoriesIndex? historyCategoriesIndex) {
    if (historyCategoriesIndex != null) {
      return ListView.separated(
        itemBuilder: (context, index) => StreamBuilder<HistoryCategoriesIndex>(
          stream: _viewModel.outputHistoryCategories,
          builder: (context, snapshot) {
            return _matrialList(context, index, snapshot.data);
          },
        ),
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey[600],
          height: 5.0,
        ),
        itemCount: historyCategoriesIndex.data.length,
      );
    } else {
      return Container();
    }
  }

  Widget _matrialList(
      BuildContext context, int i, HistoryCategoriesIndex? history) {
    if (history != null) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${history.data[i]?.title}",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 30),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "${history.data[i]?.description}",
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

  @override
  void dispose() {
    super.dispose();
    _viewModel.dispose();
  }
}
