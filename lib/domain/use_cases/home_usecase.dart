import 'package:advanced_course/data/network/failure/failure.dart';
import 'package:advanced_course/domain/models/models.dart';
import 'package:advanced_course/domain/repositories/repository.dart';
import 'package:advanced_course/domain/use_cases/base_usecase.dart';
import 'package:dartz/dartz.dart';

class HomeUseCase implements BaseUseCase<void, HomeObject> {
  final Repository _repository;

  HomeUseCase(this._repository);

  @override
  Future<Either<Failure, HomeObject>> execute(void input) async {
    return await _repository.getHomeData();
  }
}
