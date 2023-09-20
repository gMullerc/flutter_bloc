import 'package:flutter/material.dart';

class GenericTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String newValue) function;
  final String title;

  const GenericTextFormField(
      {super.key,
      required this.controller,
      required this.function,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: (newValue) {
        if (newValue != null) {
          function(newValue);
        }
      },
      decoration: InputDecoration(
          label: Text(title), labelStyle: TextStyle(fontSize: 16)),
      validator: (value) {
        if (value == '' || value == null) {
          return 'Este campo é obrigatorio';
        }
      },
    );
  }
}
