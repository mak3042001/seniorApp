import 'package:dartz/dartz.dart';
import 'package:senior/data/data_source/data_source.dart';
import 'package:senior/data/mabber/mabber.dart';
import 'package:senior/data/network/error_handling.dart';
import 'package:senior/data/network/failure.dart';
import 'package:senior/data/network/network_info.dart';
import 'package:senior/data/network/request.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/repository/domain_repository.dart';

class DataRepository implements Repository{

  final DataSource _dataSource;
  final NetworkInfo _networkInfo;


  DataRepository(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, Auth>> login(LoginRequest loginRequest) async {
    if(await _networkInfo.connection){
      try{
        final response = await _dataSource.login(loginRequest);
        if(response.successful == true){
          return Right(response.toDomain());
        }else{
          return Left(Failure(InternetStatusCode.failure, response.message ?? ResponseMessage.Default));
        }
      }catch(e){
        return Left(ErrorHandler.handle(e).failure);
      }
    }else{
      return Left(DataSources.Default.getFailure());
    }

  }

}