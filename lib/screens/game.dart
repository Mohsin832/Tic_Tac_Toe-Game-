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
  String winner = "";
  int xCounter = 0;
  int oCounter = 0;

  void displayXo(int index) {
    if (winner != "") return;

    if (grid[index] == "") {
      setState(() {
        grid[index] = currentIndex;
        currentIndex = isZero ? "O" : "X";
        isZero = !isZero;
        findWinner(grid[index]);
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

  void resetGame() {
    setState(() {
      grid = ["", "", "", "", "", "", "", "", ""];
      currentIndex = "X";
      isZero = true;
      winner = "";
    });
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
      setState(() {
        winner = currentSign;
      });

      // counterWinner() {

      // }
    } else if (!grid.contains("")) {
      winner = 'tie';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Uihelper.customText(
                text: "Score board",
                fontsize: 30,
                context: context,
                fontWeight: FontWeight.normal,
                fontfamily: "Regular",
                letterSpacing: 3,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Uihelper.customText(
                        text: "score of X ",
                        fontsize: 18,
                        context: context,
                      ),
                      Uihelper.customText(
                        text: xCounter.toString(),
                        fontsize: 40,
                        context: context,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Uihelper.customText(
                        text: "score of 0 ",
                        fontsize: 18,
                        context: context,
                      ),
                      Uihelper.customText(
                        text: oCounter.toString(),
                        fontsize: 40,
                        context: context,
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 20),
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
              if (winner != "")
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (winner == "X") {
                        xCounter++;
                      } else if (winner == "O") {
                        oCounter++;
                      }
                    });
                    grid = List.filled(9, "");
                    currentIndex = "X";
                    isZero = true;
                    winner = "";
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.accentColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(20),
                    ),
                  ),
                  child: Uihelper.customText(
                    text: "Reset the game",
                    fontsize: 18,
                    context: context,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
