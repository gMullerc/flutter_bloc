import 'package:flutter/material.dart';

class CardMenu extends StatefulWidget {
  final Icon icon;
  final String titulo;
  final Function navigateTo;
  const CardMenu(
      {super.key,
      required this.icon,
      required this.titulo,
      required this.navigateTo});

  @override
  State<CardMenu> createState() => _CardMenuState();
}

class _CardMenuState extends State<CardMenu> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.navigateTo(),
      child: Card(
        color: const ColorScheme.dark().primary,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.icon,
              Text(
                widget.titulo,
                style: TextStyle(fontSize: 24, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
