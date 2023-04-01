import 'package:advanced_course/data/network/failure/failure.dart';
import 'package:advanced_course/data/network/requests/requests.dart';
import 'package:advanced_course/domain/models/models.dart';
import 'package:advanced_course/domain/repositories/repository.dart';
import 'package:advanced_course/domain/use_cases/base_usecase.dart';
import 'package:dartz/dartz.dart';

class RegisterUseCase
    implements BaseUseCase<RegisterUseCaseInput, Authentication> {
  final Repository _repository;

  RegisterUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
    RegisterUseCaseInput input,
  ) async {
    return await _repository.register(
      RegisterRequest(
        input.userName,
        input.countryMobileCode,
        input.mobileNumber,
        input.email,
        input.password,
        input.profilePicture,
      ),
    );
  }
}

class RegisterUseCaseInput {
  String userName;
  String countryMobileCode;
  String mobileNumber;
  String email;
  String password;
  String profilePicture;

  RegisterUseCaseInput(
    this.userName,
    this.countryMobileCode,
    this.mobileNumber,
    this.email,
    this.password,
    this.profilePicture,
  );
}
