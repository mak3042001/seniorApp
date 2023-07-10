

import 'dart:async';
import 'dart:ffi';

import 'package:rxdart/rxdart.dart';
import 'package:senior/app/di.dart';
import 'package:senior/data/network/dio_factory.dart';
import 'package:senior/domain/usecase/auth/messageSend.dart';
import 'package:senior/presentation/base/baseViewModel.dart';
import 'package:senior/presentation/common/freezeClasses.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer__impl.dart';

import '../../../domain/model/model.dart';
import '../../../domain/usecase/auth/profile_index_usecase.dart';

class ChatViewModel extends BaseViewModel
    with ChatViewModelInputs, ChatViewModelOutputs {
  String token = "";
  final StreamController _fromIdStreamController =
  StreamController<String>.broadcast();
  final StreamController _toIdStreamController =
  StreamController<String>.broadcast();
  final StreamController _messageStreamController =
  StreamController<String>.broadcast();

  final _profileStreamController = BehaviorSubject<Profile>();


  final StreamController _areAllInputsValidStreamController =
  StreamController<void>.broadcast();

  StreamController isUserLoggedInSuccessfullyStreamController =
  StreamController<bool>();

  var chatObject = ChatObject("", "" , "");
  final MessageSendUseCase _messageSendUseCase;
  final ProfileIndexUseCase profileIndexUseCase;


  ChatViewModel(this._messageSendUseCase , this.profileIndexUseCase);

  // inputs
  @override
  void dispose() {
    super.dispose();
    _profileStreamController.close();
    _fromIdStreamController.close();
    _toIdStreamController.close();
    _messageStreamController.close();
    _areAllInputsValidStreamController.close();
    isUserLoggedInSuccessfullyStreamController.close();
  }

  @override
  void start() {
    // view model should tell view please show content state
    _loadData();
  }

  _loadData() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await profileIndexUseCase.execute(Void)).fold(
          (failure) {
        inputState.add(ErrorState(
            StateRendererType.fullScreenErrorState, failure.message));
      },
          (profile) async {
        inputState.add(ContentState());
        inputProfile.add(profile);
      },
    );
  }


  @override
  Sink get inputProfile => _profileStreamController.sink;

  @override
  Sink get inputToId => _toIdStreamController.sink;

  @override
  Sink get inputFromId => _fromIdStreamController.sink;

  @override
  Sink get inputAreAllInputsValid => _areAllInputsValidStreamController.sink;

  @override
  setToId(String toId) {
    inputToId.add(toId);
    chatObject = chatObject.copyWith(toId: toId);
    inputAreAllInputsValid.add(null);
  }

  @override
  setFromId(String fromId) {
    inputFromId.add(fromId);
    chatObject = chatObject.copyWith(fromId: fromId);
    inputAreAllInputsValid.add(null);
  }

  @override
  send(int senderId , int receiverId , String message) async {
    (await _messageSendUseCase.execute(
        MessageSendUseCaseInput(senderId, receiverId , message)))
        .fold(
            (failure) => {
          // left -> failure
          inputState.add(ErrorState(
              StateRendererType.popupErrorState, failure.message))
        }, (data) {
      // right -> data (success)
      // content
      inputState.add(ContentState());
      // navigate to main screen
      isUserLoggedInSuccessfullyStreamController.add(true);

      DioFactory(instance());
    });
  }


  @override
  Stream<Profile> get outputProfile =>
      _profileStreamController.stream.map((profile) => profile);

  // outputs
  @override
  Stream<bool> get outIsToIdValid => _toIdStreamController.stream
      .map((toId) => _isToIdValid(toId));

  @override
  Stream<bool> get outIsFromIdValid => _fromIdStreamController.stream
      .map((fromId) => _isFromIdValid(fromId));

  @override
  Stream<bool> get outAreAllInputsValid =>
      _areAllInputsValidStreamController.stream
          .map((_) => _areAllInputsValid());

  bool _isToIdValid(String toId) {
    return toId.isNotEmpty;
  }

  bool _isFromIdValid(String fromId) {
    return fromId.isNotEmpty;
  }

  bool _isMessageValid(String message) {
    return message.isNotEmpty;
  }

  bool _areAllInputsValid() {
    return _isToIdValid(chatObject.toId) &&
        _isFromIdValid(chatObject.fromId) && _isMessageValid(chatObject.message);
  }

  @override
  Sink get inputMessage => _messageStreamController.sink;

  @override
  Stream<bool> get outIsMessageValid => _messageStreamController.stream
      .map((message) => _isMessageValid(message));

  @override
  setMessage(String message) {
    inputMessage.add(message);
    chatObject = chatObject.copyWith(message: message);
    inputAreAllInputsValid.add(null);
  }
}

abstract class ChatViewModelInputs {
  setFromId(String fromId);

  setToId(String toId);

  setMessage(String message);

  send(int senderId , int receiverId , String message);

  Sink get inputProfile;

  Sink get inputFromId;

  Sink get inputToId;

  Sink get inputMessage;

  Sink get inputAreAllInputsValid;
}

abstract class ChatViewModelOutputs {
  Stream<Profile> get outputProfile;

  Stream<bool> get outIsFromIdValid;

  Stream<bool> get outIsToIdValid;

  Stream<bool> get outIsMessageValid;

  Stream<bool> get outAreAllInputsValid;
}