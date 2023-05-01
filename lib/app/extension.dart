import 'package:senior/app/constant.dart';

extension NonNullString on String?{
  String orEmpty(){
    if(this == null){
      return Constant.empty;
    }else{
      return this!;
    }
  }
}

extension NonNullInt on int?{
  int orEmpty(){
    if(this == null){
      return Constant.zero;
    }else{
      return this!;
    }
  }
}