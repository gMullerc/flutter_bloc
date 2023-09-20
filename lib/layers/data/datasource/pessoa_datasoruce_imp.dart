import 'package:aulachata/core/datastorage/datastorage_client.dart';
import 'package:aulachata/layers/data/datasource/pessoa_datasource.dart';
import 'package:aulachata/layers/data/models/pessoa_model.dart';
import 'package:aulachata/layers/domain/entities/pessoa_entity.dart';

class PessoaDatasourceImp implements IPessoaDatasource {
  final DataStorageClient client;
  PessoaDatasourceImp({
    required this.client,
  });

  @override
  void cadastrarPessoa({required PessoaEntity pessoa}) async {
    client.post(pessoa: pessoa);
  }

  @override
  Future<List<PessoaModel>> consultarPessoas() {
    var result = client.getAll();
    return result;
  }
}
