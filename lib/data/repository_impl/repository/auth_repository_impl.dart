import 'package:dirdashly/domin/repository_interface/data_source/auth_remote_data_source_contract.dart';
import 'package:dirdashly/domin/repository_interface/repository/auth_repository_contract.dart';

import '../../../domin/entity/my_user_entity.dart';

class AuthRepositoryImpl implements AuthRepositoryContract {
  AuthRemoteDataSourceContract remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<MyUserEntity?> register(String email, String password) {
    return remoteDataSource.register(email, password);
  }

  @override
  Future registerByGoogle() {
    return remoteDataSource.registerByGoogle();
  }
}
