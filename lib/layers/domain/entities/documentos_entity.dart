import 'package:equatable/equatable.dart';

class DocumentosEntity extends Equatable {
  final String cpf;
  final String rg;
  final String certidaoNascimento;

  const DocumentosEntity({
    required this.cpf,
    required this.rg,
    required this.certidaoNascimento,
  });

  @override
  List<Object?> get props => [cpf, rg, certidaoNascimento];
}
