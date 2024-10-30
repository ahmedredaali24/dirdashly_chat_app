import '../../entity/my_user_entity.dart';

abstract class AuthRemoteDataSourceContract {
  Future register(String email, String password,String userName);

  Future registerByGoogle();
}
