import '../../entity/my_user_entity.dart';

abstract class AuthRepositoryContract {
  Future register(String email, String password,String userName);

  Future registerByGoogle();
}
