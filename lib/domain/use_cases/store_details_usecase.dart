import 'dart:ffi';

import 'package:advanced_course/data/network/failure/failure.dart';
import 'package:advanced_course/domain/models/models.dart';
import 'package:advanced_course/domain/use_cases/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../repositories/repository.dart';

class StoreDetailsUseCase extends BaseUseCase<Void, StoreDetails> {
  Repository repository;

  StoreDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, StoreDetails>> execute(void input) {
    return repository.getStoreDetails();
  }
}
