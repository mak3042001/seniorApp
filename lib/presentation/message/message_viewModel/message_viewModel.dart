import 'dart:ffi';

import 'package:rxdart/subjects.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/presentation/base/baseViewModel.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer__impl.dart';

import '../../../domain/usecase/auth/message.dart';
import '../../common/state_renderer/state_renderer.dart';

class MessageViewModel extends BaseViewModel
    with MessageViewModelInput, MessageViewModelOutput {
  final _messageStreamController = BehaviorSubject<Message>();

  final MessageUseCase messageUseCase;

  MessageViewModel(this.messageUseCase);

  @override
  start() async {
    _loadData();
  }

  _loadData() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await messageUseCase.execute(Void)).fold(
          (failure) {
        inputState.add(ErrorState(
            StateRendererType.fullScreenErrorState, failure.message));
      },
          (message) async {
        inputState.add(ContentState());
        inputMessage.add(message);
      },
    );
  }

  @override
  void dispose() {
    _messageStreamController.close();
  }

  @override
  Sink get inputMessage => _messageStreamController.sink;

  //output
  @override
  Stream<Message> get outputMessage =>
      _messageStreamController.stream.map((message) => message);
}

abstract class MessageViewModelInput {
  Sink get inputMessage;
}

abstract class MessageViewModelOutput {
  Stream<Message> get outputMessage;
}