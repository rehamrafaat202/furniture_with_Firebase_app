import 'package:flutter/material.dart';

class ContainerButton extends StatelessWidget {
  final String title;

  final Function submit;
  final Color color;
  final Color txtColor;

  const ContainerButton({
    required this.color,
    required this.txtColor,
    required this.title,
    required this.submit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => submit(),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        color: color,
        child: Text(
          title,
          style: TextStyle(
              color: txtColor, fontWeight: FontWeight.bold, fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
