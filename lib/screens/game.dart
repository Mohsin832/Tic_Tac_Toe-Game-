import 'package:flutter/material.dart';
import 'package:tictactoe/constants/colors.dart';
import 'package:tictactoe/widgets/uihelper.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  void tapped(int index) {
    setState(() {
      if (oTurn == true && displayXO[index] == "") {
        displayXO[index] = "O";
      } else {
        displayXO[index] = "X";
      }
      oTurn = !oTurn;
    });
  }

  bool oTurn = true;
  List<String> displayXO = ["", "", "", "", "", "", "", "", ""];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Uihelper.customText(
                text: "Score board",
                fontsize: 18,
                context: context,
                fontWeight: FontWeight.normal,
                fontfamily: "Regular",
                letterSpacing: 3,
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 5,
                          color: AppColor.primaryColor,
                        ),
                        color: AppColor.secondaryColor,
                      ),
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Uihelper.customText(
                            text: displayXO[index],
                            fontsize: 80,
                            context: context,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            Expanded(
              flex: 2,
              child: Uihelper.customText(
                text: "Timer",
                fontsize: 18,
                context: context,
                fontWeight: FontWeight.normal,
                fontfamily: "Regular",
                letterSpacing: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
