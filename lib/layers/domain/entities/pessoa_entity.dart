import 'package:aulachata/layers/domain/entities/documentos_entity.dart';
import 'package:equatable/equatable.dart';

class PessoaEntity extends Equatable {
  final String nome;
  final String sobrenome;
  final String etnia;
  final String genero;
  final DocumentosEntity documentos;

  const PessoaEntity(
      {required this.nome,
      required this.sobrenome,
      required this.etnia,
      required this.genero,
      required this.documentos});

  @override
  List<Object?> get props => [nome, sobrenome, etnia, genero, documentos];
}
