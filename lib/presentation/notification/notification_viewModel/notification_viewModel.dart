import 'dart:ffi';

import 'package:rxdart/subjects.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/presentation/base/baseViewModel.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer__impl.dart';

import '../../../domain/usecase/notification/notification_usecase.dart';
import '../../common/state_renderer/state_renderer.dart';

class NotificationViewModel extends BaseViewModel
    with NotificationViewModelInput, NotificationViewModelOutput {
  final _notificationStreamController = BehaviorSubject<NotificationIndex>();

  final NotificationUseCase notificationUseCase;

  NotificationViewModel(this.notificationUseCase);

  @override
  start() async {
    _loadData();
  }

  _loadData() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await notificationUseCase.execute(Void)).fold(
          (failure) {
        inputState.add(ErrorState(
            StateRendererType.fullScreenErrorState, failure.message));
      },
          (notification) async {
        inputState.add(ContentState());
        inputNotification.add(notification);
      },
    );
  }

  @override
  void dispose() {
    _notificationStreamController.close();
  }

  @override
  Sink get inputNotification => _notificationStreamController.sink;

  //output
  @override
  Stream<NotificationIndex> get outputNotification =>
      _notificationStreamController.stream.map((notification) => notification);
}

abstract class NotificationViewModelInput {
  Sink get inputNotification;
}

abstract class NotificationViewModelOutput {
  Stream<NotificationIndex> get outputNotification;
}