import 'dart:convert';

import 'package:aulachata/core/datastorage/datastorage_client.dart';
import 'package:aulachata/layers/data/models/pessoa_model.dart';
import 'package:aulachata/layers/domain/entities/pessoa_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesImp implements DataStorageClient {
  @override
  Future<void> post({required PessoaEntity pessoa}) async {
    var userModel = PessoaModel.fromEntity(pessoa);
    final prefs = await SharedPreferences.getInstance();

    prefs.setString(pessoa.documentos.cpf, jsonEncode(userModel.toJson()));
  }

  @override
  Future<List<PessoaModel>> getAll() async {
    List<PessoaModel> pessoaModelList = [];
    final prefs = await SharedPreferences.getInstance();
    var keys = prefs.getKeys();

    print(keys.length);

    for (var key in keys) {
      var teste = prefs.getString(key);
      print(teste);
      var pessoaModel = PessoaModel.fromJson(
        jsonDecode(teste!),
      );

      pessoaModelList.add(pessoaModel);
    }
    return pessoaModelList;
  }
}
