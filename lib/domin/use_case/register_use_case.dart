import 'package:dirdashly/domin/repository_interface/repository/auth_repository_contract.dart';

import '../entity/my_user_entity.dart';

class RegisterUseCase {
  AuthRepositoryContract authRepositoryContract;

  RegisterUseCase({required this.authRepositoryContract});

  Future<MyUserEntity?> invoke(String email, String password) {
    return authRepositoryContract.register(email, password);
  }


}
