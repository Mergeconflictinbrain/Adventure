import 'dart:io';

import 'start.dart';

void main() async {
  //this game is saves as "inthecabin => main.dart"
  String currentstep = "inthecabin";
  savegame(currentstep);
  inthecabin();
}

inthecabin() async {
  int standart = 50;
  await printletterbyletter("you are in", standart);
}

/* printletterbyletter cause idontknow*/
Future<void> printletterbyletter(String text, int time) async {
  {
    for (int i = 0; i < text.length; i++) {
      stdout.write(text[i]);
      await Future.delayed(Duration(milliseconds: time));
    }
  }

  print(""); // Move to the next line after printing the complete text
}
