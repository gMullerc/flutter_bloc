import 'package:aulachata/core/error/failure/failure.dart';
import 'package:aulachata/core/usecase/usecase.dart';
import 'package:aulachata/layers/domain/entities/pessoa_entity.dart';
import 'package:aulachata/layers/domain/repositories/pessoa_repository.dart';
import 'package:dartz/dartz.dart';

class ListarPessoasUsecase extends Usecase<List<PessoaEntity>, NoParams> {
  final IPessoaRepository repository;
  ListarPessoasUsecase({required this.repository});
  @override
  Future<Either<Failure, List<PessoaEntity>>> call(NoParams params,
      [NoParams? otherParams]) async {
    final result = await repository.consultarPessoas();
    return result.fold(
      (l) {
        print("left");
        return Left(l);
      },
      (r) {
        print('right');
        return Right(r);
      },
    );
  }
}
