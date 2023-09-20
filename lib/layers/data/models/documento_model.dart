import 'package:aulachata/layers/domain/entities/documentos_entity.dart';
import 'package:aulachata/layers/domain/entities/pessoa_entity.dart';

class DocumentoModel extends DocumentosEntity {
  const DocumentoModel({
    required String rg,
    required String cpf,
    required String certidaoNascimento,
  }) : super(
          rg: rg,
          cpf: cpf,
          certidaoNascimento: certidaoNascimento,
        );
  factory DocumentoModel.fromJson(Map<String, dynamic> json) {
    print('fromjson');
    return DocumentoModel(
      rg: json['rg'],
      cpf: json['cpf'],
      certidaoNascimento: json['certidaoNascimento'],
    );
  }
  factory DocumentoModel.fromEntity(DocumentosEntity entity) {
    print('from entt');
    return DocumentoModel(
      rg: entity.rg,
      cpf: entity.cpf,
      certidaoNascimento: entity.certidaoNascimento,
    );
  }

  Map<String, dynamic> toJson() {
    print('to json');
    return {
      "rg": rg,
      "cpf": cpf,
      "certidaoNascimento": certidaoNascimento,
    };
  }
}
