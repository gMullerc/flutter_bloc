import 'package:aulachata/core/error/exceptions/exceptions.dart';
import 'package:aulachata/core/error/failure/failure.dart';
import 'package:aulachata/core/usecase/usecase.dart';
import 'package:aulachata/layers/data/datasource/pessoa_datasource.dart';
import 'package:aulachata/layers/data/models/pessoa_model.dart';
import 'package:aulachata/layers/domain/entities/pessoa_entity.dart';
import 'package:aulachata/layers/domain/repositories/pessoa_repository.dart';
import 'package:dartz/dartz.dart';

class PessoaRepositoryImp implements IPessoaRepository {
  final IPessoaDatasource datasource;
  PessoaRepositoryImp({required this.datasource});

  @override
  Future<Either<Failure, NoParams>> cadastrarPessoa(
      {required PessoaEntity pessoa}) async {
    try {
      datasource.cadastrarPessoa(pessoa: pessoa);
      return Right(NoParams());
    } on ServerException catch (_) {
      return Left(
        ServerFailure(message: 'Ocorreu um erro ao conectar-se ao servidor'),
      );
    }
  }

  @override
  Future<Either<Failure, List<PessoaEntity>>> consultarPessoas() async {
    try {
      List<PessoaModel> response = await datasource.consultarPessoas();
      return Right(response);
    } on ServerFailure catch (_) {
      return Left(
        ServerFailure(message: "Ocorreu um erro ao se conectar com o servidor"),
      );
    }
  }
}
