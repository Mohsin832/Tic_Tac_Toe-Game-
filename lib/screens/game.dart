import 'package:flutter/material.dart';
import 'package:tictactoe/constants/colors.dart';
import 'package:tictactoe/widgets/uihelper.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  List<String> grid = ["", "", "", "", "", "", "", "", ""];
  String currentIndex = "X";
  bool isZero = true;

  void displayXo(int index) {
    if (grid[index] == "") {
      setState(() {
        grid[index] = currentIndex;
        currentIndex = isZero ? "O" : "X";
        isZero = !isZero;
      });
    }
  }

  bool checkMove(int i1, int i2, int i3, String sign) {
    if (grid[i1] == sign && grid[i2] == sign && grid[i3] == sign) {
      return true;
    } else {
      return false;
    }
  }

  void findWinner(String currentSign) {
    if (checkMove(0, 1, 2, currentSign) ||
        checkMove(3, 4, 5, currentSign) ||
        checkMove(6, 7, 8, currentSign) ||
        checkMove(0, 3, 6, currentSign) ||
        checkMove(1, 4, 7, currentSign) ||
        checkMove(2, 5, 8, currentSign) ||
        checkMove(0, 4, 8, currentSign) ||
        checkMove(2, 4, 6, currentSign)) {
      print("$currentSign Won");
    }
  }

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
                shrinkWrap: true,
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Colors.blue,
                    focusColor: Colors.blue,
                    onTap: () {
                      displayXo(index);
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
                            text: grid[index],
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
