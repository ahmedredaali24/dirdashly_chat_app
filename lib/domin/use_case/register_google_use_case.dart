import 'package:dirdashly/domin/repository_interface/repository/auth_repository_contract.dart';

class RegisterGoogleUseCase {
  AuthRepositoryContract authRepositoryContract;

  RegisterGoogleUseCase({required this.authRepositoryContract});

  Future invoke() {
    return authRepositoryContract.registerByGoogle();
  }
}
