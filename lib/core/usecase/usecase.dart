import 'package:aulachata/core/error/failure/failure.dart';
import 'package:dartz/dartz.dart';

abstract class Usecase<Output, Input> {
  Future<Either<Failure, Output>> call(Input params, [Input? otherParams]);
}

class NoParams {}
