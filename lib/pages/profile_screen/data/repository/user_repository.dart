import 'package:dartz/dartz.dart';
import 'package:untitled2/pages/profile_screen/data/data_source/user_data_source.dart';
import 'package:untitled2/pages/profile_screen/data/user_model.dart';

abstract class IUserRepository {
  Future<Either<String, UserModel>> getUserDataRepo();
}

class UserRepository extends IUserRepository {
  final IUserDataSource _dataSource;

  UserRepository(this._dataSource);

  @override
  Future<Either<String, UserModel>> getUserDataRepo()async {
    try {
      var response =await _dataSource.getUserData();
      return right(response);
    } catch (e) {
      return left(e.toString());

    }
  }
}
