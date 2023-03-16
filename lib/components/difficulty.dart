import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  final int dificultyLevel;

  const Difficulty({required this.dificultyLevel, Key? key}) : super(key: key);

  Color changeColor(int dificuldade, int nivel) {
    if (dificuldade >= nivel) {
      return Colors.purple;
    } else {
      return Colors.purple.shade100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 15,
          color: changeColor(dificultyLevel, 1),
        ),
        Icon(
          Icons.star,
          size: 15,
          color: changeColor(dificultyLevel, 2),
        ),
        Icon(
          Icons.star,
          size: 15,
          color: changeColor(dificultyLevel, 3),
        ),
        Icon(
          Icons.star,
          size: 15,
          color: changeColor(dificultyLevel, 4),
        ),
        Icon(
          Icons.star,
          size: 15,
          color: changeColor(dificultyLevel, 5),
        ),
      ],
    );
  }
}
