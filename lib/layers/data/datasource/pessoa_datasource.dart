import 'package:aulachata/layers/data/models/pessoa_model.dart';
import 'package:aulachata/layers/domain/entities/pessoa_entity.dart';

abstract class IPessoaDatasource {
  void cadastrarPessoa({required PessoaEntity pessoa});
  Future<List<PessoaModel>> consultarPessoas();
}
