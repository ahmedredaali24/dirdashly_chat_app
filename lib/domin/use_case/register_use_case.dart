import 'package:dirdashly/domin/repository_interface/repository/auth_repository_contract.dart';

import '../entity/my_user_entity.dart';

class RegisterUseCase {
  AuthRepositoryContract authRepositoryContract;

  RegisterUseCase({required this.authRepositoryContract});

  Future invoke(String email, String password, String userName) {
    return authRepositoryContract.register(email, password, userName);
  }
}
