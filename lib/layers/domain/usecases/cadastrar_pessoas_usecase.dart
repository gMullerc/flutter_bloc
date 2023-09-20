import 'package:aulachata/core/error/failure/failure.dart';
import 'package:aulachata/core/usecase/usecase.dart';
import 'package:aulachata/layers/domain/entities/pessoa_entity.dart';
import 'package:aulachata/layers/domain/repositories/pessoa_repository.dart';
import 'package:dartz/dartz.dart';

class CadastrarPessoaUsecase extends Usecase<NoParams, PessoaEntity> {
  final IPessoaRepository repository;
  CadastrarPessoaUsecase({required this.repository});

  @override
  Future<Either<Failure, NoParams>> call(PessoaEntity params,
      [PessoaEntity? otherParams]) async {
    final result = await repository.cadastrarPessoa(pessoa: params);

    return result.fold((left) => Left(left), (right) => Right(right));
  }
}
