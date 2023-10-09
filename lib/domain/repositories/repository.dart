import '../../data/network/failure/failure.dart';
import '../../data/network/requests/requests.dart';
import '../models/models.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(
    LoginRequest loginRequest,
  );

  Future<Either<Failure, String>> forgotPassword(
    String email,
  );

  Future<Either<Failure, Authentication>> register(
    RegisterRequest registerRequest,
  );

  Future<Either<Failure, HomeObject>> getHomeData();
}
