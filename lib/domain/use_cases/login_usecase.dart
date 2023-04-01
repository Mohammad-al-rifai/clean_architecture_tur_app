import 'package:dartz/dartz.dart';

import '../../data/network/failure/failure.dart';
import '../../data/network/requests/requests.dart';
import '../models/models.dart';
import '../repositories/repository.dart';
import 'base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
    LoginUseCaseInput input,
  ) async {
    return await _repository.login(
      LoginRequest(
        input.email,
        input.password,
      ),
    );
  }
}

class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput(this.email, this.password);
}
