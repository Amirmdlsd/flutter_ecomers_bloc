import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:untitled2/pages/edit_page/data/data_source/edit_data_source.dart';
import 'package:untitled2/pages/profile_screen/data/data_source/user_data_source.dart';

abstract class IEditUserRepository {
  Future<Either<String,String>>editUser({required File file ,
    required
    String name,required String email});
}


class EditUserRepository extends IEditUserRepository{
  final IEditUserDataSource _dataSource;
  EditUserRepository(this._dataSource);

  @override
  Future<Either<String, String>> editUser({required File file ,
    required
    String name,required String email}) async{
   try
   {
     var response =_dataSource.editUser(file, name, email);
     return right('مشخصات ثبت شد');
   }catch(e){
     return left(e.toString());
   }
  }
}