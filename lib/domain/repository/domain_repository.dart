import 'package:dartz/dartz.dart';
import 'package:senior/data/network/failure.dart';
import 'package:senior/data/network/request.dart';
import 'package:senior/domain/model/model.dart';

abstract class Repository{
  Future<Either<Failure,Auth>> login(LoginRequest loginRequest);
}