import 'dart:ffi';

import 'package:rxdart/subjects.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/presentation/base/baseViewModel.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer__impl.dart';

import '../../../domain/usecase/auth/user.dart';
import '../../common/state_renderer/state_renderer.dart';

class UserViewModel extends BaseViewModel
    with UserViewModelInput, UserViewModelOutput {
  final _userStreamController = BehaviorSubject<UserUser>();

  final UserUseCase userUseCase;

  UserViewModel(this.userUseCase);

  @override
  start() async {
    _loadData();
  }

  _loadData() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await userUseCase.execute(Void)).fold(
          (failure) {
        inputState.add(ErrorState(
            StateRendererType.fullScreenErrorState, failure.message));
      },
          (user) async {
        inputState.add(ContentState());
        inputUser.add(user);
      },
    );
  }

  @override
  void dispose() {
    _userStreamController.close();
  }

  @override
  Sink get inputUser => _userStreamController.sink;

  //output
  @override
  Stream<UserUser> get outputUser =>
      _userStreamController.stream.map((user) => user);
}

abstract class UserViewModelInput {
  Sink get inputUser;
}

abstract class UserViewModelOutput {
  Stream<UserUser> get outputUser;
}