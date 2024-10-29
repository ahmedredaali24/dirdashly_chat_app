import 'package:dirdashly/data/repository_impl/data_source/auth_remote_data_source_impl.dart';
import 'package:dirdashly/data/repository_impl/repository/auth_repository_impl.dart';
import 'package:dirdashly/domin/repository_interface/data_source/auth_remote_data_source_contract.dart';
import 'package:dirdashly/domin/repository_interface/repository/auth_repository_contract.dart';
import 'package:dirdashly/domin/use_case/register_google_use_case.dart';
import 'package:dirdashly/domin/use_case/register_use_case.dart';

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(
      authRepositoryContract: injectAuthRepositoryContract());
}

RegisterGoogleUseCase injectRegisterGoogleUseCase() {
  return RegisterGoogleUseCase(
      authRepositoryContract: injectAuthRepositoryContract());
}

AuthRepositoryContract injectAuthRepositoryContract() {
  return AuthRepositoryImpl(
      remoteDataSource: injectAuthRemoteDataSourceContract());
}

AuthRemoteDataSourceContract injectAuthRemoteDataSourceContract() {
  return AuthRemoteDataSourceImpl();
}
