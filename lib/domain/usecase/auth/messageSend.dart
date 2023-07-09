import 'package:dartz/dartz.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/usecase/auth/base_usecase.dart';

import '../../../data/network/failure.dart';
import '../../../data/network/request.dart';
import '../../repository/domain_repository.dart';

class MessageSendUseCase implements BaseUseCase<MessageSendUseCaseInput,MessageSend>{

  final Repository _repository;

  MessageSendUseCase(this._repository);

  @override
  Future<Either<Failure, MessageSend>> execute(MessageSendUseCaseInput input) async {
    return await _repository.messageSend(MessageSendRequest(input.fromId, input.toId, input.message));
  }

}

class MessageSendUseCaseInput {
  int fromId;
  int toId;
  String message;

  MessageSendUseCaseInput(this.fromId, this.toId, this.message);
}