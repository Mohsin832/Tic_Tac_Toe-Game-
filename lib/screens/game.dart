import 'package:flutter/material.dart';
import 'package:tictactoe/constants/colors.dart';
import 'package:tictactoe/widgets/uihelper.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Uihelper.customText(
          text: "Tic-Tac-Toe Game",
          fontsize: 15,
          context: context,
          fontfamily: "Regular",
        ),
      ),
    );
  }
}
