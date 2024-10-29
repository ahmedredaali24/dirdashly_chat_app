import '../../entity/my_user_entity.dart';

abstract class AuthRepositoryContract {
  Future<MyUserEntity?> register(String email, String password);

  Future registerByGoogle();
}
