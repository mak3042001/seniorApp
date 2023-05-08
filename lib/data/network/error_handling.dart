import 'package:dio/dio.dart';
import 'package:senior/data/network/failure.dart';

class ErrorHandler implements Exception{
  late Failure failure;

  ErrorHandler.handle(dynamic error){
    if(error is DioError){
      failure = _handleError(error);
    }else{
      failure = DataSources.Default.getFailure();
    }
  }
}

Failure _handleError(DioError error) {
  switch(error.type){

    case DioErrorType.connectionTimeout:
      return DataSources.ConnectTimeOut.getFailure();
    case DioErrorType.sendTimeout:
      return DataSources.SendTimeOut.getFailure();
    case DioErrorType.receiveTimeout:
      return DataSources.ReceiveTimeOut.getFailure();
    case DioErrorType.badCertificate:
      return DataSources.BadRequest.getFailure();
    case DioErrorType.badResponse:
      if(error.response != null && error.response?.statusCode != null && error.response?.statusMessage != null){
        return Failure(error.response?.statusCode ?? 0, error.response?.statusMessage ?? "");
      }else{
        return DataSources.Default.getFailure();
      }
    case DioErrorType.cancel:
      return DataSources.Cancel.getFailure();
    case DioErrorType.connectionError:
      return DataSources.ConnectTimeOut.getFailure();
    case DioErrorType.unknown:
      return DataSources.Default.getFailure();
  }
}

enum DataSources{
  Success,
  NoContent,
  BadRequest,
  Unauthorised,
  ForBidden,
  InternalServerError,
  ConnectTimeOut,
  Cancel,
  ReceiveTimeOut,
  SendTimeOut,
  CacheError,
  NoInternetConnection,
  Default,
}

extension DataSourceExtension on DataSources{
  Failure getFailure(){
   switch(this){

     case DataSources.Success:
       return Failure(ResponseCode.Success, ResponseMessage.Success);
     case DataSources.NoContent:
       return Failure(ResponseCode.NoContent, ResponseMessage.NoContent);
     case DataSources.BadRequest:
       return Failure(ResponseCode.BadRequest, ResponseMessage.BadRequest);
     case DataSources.Unauthorised:
       return Failure(ResponseCode.Unauthorised, ResponseMessage.Unauthorised);
     case DataSources.ForBidden:
       return Failure(ResponseCode.ForBidden, ResponseMessage.ForBidden);
     case DataSources.InternalServerError:
       return Failure(ResponseCode.InternalServerError, ResponseMessage.InternalServerError);
     case DataSources.ConnectTimeOut:
       return Failure(ResponseCode.ConnectTimeOut, ResponseMessage.ConnectTimeOut);
     case DataSources.Cancel:
       return Failure(ResponseCode.Cancel, ResponseMessage.Cancel);
     case DataSources.ReceiveTimeOut:
       return Failure(ResponseCode.ReceiveTimeOut, ResponseMessage.ReceiveTimeOut);
     case DataSources.SendTimeOut:
       return Failure(ResponseCode.SendTimeOut, ResponseMessage.SendTimeOut);
     case DataSources.CacheError:
       return Failure(ResponseCode.CacheError, ResponseMessage.CacheError);
     case DataSources.NoInternetConnection:
       return Failure(ResponseCode.NoInternetConnection, ResponseMessage.NoInternetConnection);
     case DataSources.Default:
       return Failure(ResponseCode.Default, ResponseMessage.Default);
   }
  }
}

class ResponseCode{
  static const int Success = 200;
  static const int NoContent = 201;
  static const int BadRequest = 400;
  static const int Unauthorised = 401;
  static const int ForBidden = 403;
  static const int InternalServerError = 500;

  static const int ConnectTimeOut = -1;
  static const int Cancel = -2;
  static const int ReceiveTimeOut = -3;
  static const int SendTimeOut = -4;
  static const int CacheError = -5;
  static const int NoInternetConnection = -6;
  static const int Default = -7;
}

class ResponseMessage{
  static const String Success = "Success";
  static const String NoContent = "NoContent";
  static const String BadRequest = "BadRequest";
  static const String Unauthorised = "Unauthorised";
  static const String ForBidden = "ForBidden";
  static const String InternalServerError = "InternalServerError";

  static const String ConnectTimeOut = "ConnectTimeOut";
  static const String Cancel = "Cancel";
  static const String ReceiveTimeOut = "ReceiveTimeOut";
  static const String SendTimeOut = "SendTimeOut";
  static const String CacheError = "CacheError";
  static const String NoInternetConnection = "NoInternetConnection";
  static const String Default = "Default";
}

class InternetStatusCode{
  static const int success = 0;
  static const int failure = 0;
}