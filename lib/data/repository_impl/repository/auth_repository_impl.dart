import 'package:dirdashly/domin/repository_interface/data_source/auth_remote_data_source_contract.dart';
import 'package:dirdashly/domin/repository_interface/repository/auth_repository_contract.dart';

import '../../../domin/entity/my_user_entity.dart';

class AuthRepositoryImpl implements AuthRepositoryContract {
  AuthRemoteDataSourceContract remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future register(String email, String password,String userName) {
    return remoteDataSource.register(email, password,userName);
  }

  @override
  Future registerByGoogle() {
    return remoteDataSource.registerByGoogle();
  }
}
