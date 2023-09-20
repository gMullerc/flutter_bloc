import 'package:aulachata/core/error/failure/failure.dart';
import 'package:aulachata/core/usecase/usecase.dart';
import 'package:aulachata/layers/domain/entities/pessoa_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IPessoaRepository {
  Future<Either<Failure, NoParams>> cadastrarPessoa(
      {required PessoaEntity pessoa});

  Future<Either<Failure, List<PessoaEntity>>> consultarPessoas();
}
