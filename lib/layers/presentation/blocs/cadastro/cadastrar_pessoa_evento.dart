import 'package:aulachata/layers/domain/entities/pessoa_entity.dart';

abstract class CadastrarPessoaEvento {}

class EventoRegistrarPessoa extends CadastrarPessoaEvento {
  final PessoaEntity pessoa;
  EventoRegistrarPessoa({required this.pessoa});
}

class EventoVoltarPagina extends CadastrarPessoaEvento {}
