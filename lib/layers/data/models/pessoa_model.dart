import 'package:aulachata/layers/data/models/documento_model.dart';
import 'package:aulachata/layers/domain/entities/documentos_entity.dart';
import 'package:aulachata/layers/domain/entities/pessoa_entity.dart';

class PessoaModel extends PessoaEntity {
  const PessoaModel(
      {required String nome,
      required String sobrenome,
      required String etnia,
      required String genero,
      required DocumentosEntity documentos})
      : super(
            nome: nome,
            sobrenome: sobrenome,
            etnia: etnia,
            genero: genero,
            documentos: documentos);
  factory PessoaModel.fromJson(Map<String, dynamic> json) => PessoaModel(
        nome: json['nome'],
        sobrenome: json['sobrenome'],
        etnia: json['etnia'],
        genero: json['genero'],
        documentos: DocumentoModel.fromJson(
          json['documentos'],
        ),
      );

  factory PessoaModel.fromEntity(PessoaEntity entity) {
    return PessoaModel(
        nome: entity.nome,
        sobrenome: entity.sobrenome,
        etnia: entity.etnia,
        genero: entity.genero,
        documentos: entity.documentos);
  }

  Map<String, dynamic> toJson() {
    return {
      "nome": nome,
      "sobrenome": sobrenome,
      "etnia": etnia,
      "genero": genero,
      "documentos": DocumentoModel.fromEntity(documentos).toJson(),
    };
  }
}
