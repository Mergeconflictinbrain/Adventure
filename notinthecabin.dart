import 'dart:io';

import 'start.dart';

void main() async {
  String currentstep = "notinthecabin";
  savegame(currentstep);
  notinthecabin();
}

void notinthecabin() async {
  int standart = 50;
  await printletterbyletter("You are wanderin mor into the wood", standart);
}

Future<void> printletterbyletter(String text, int time) async {
  {
    for (int i = 0; i < text.length; i++) {
      stdout.write(text[i]);
      await Future.delayed(Duration(milliseconds: time));
    }
  }

  print(""); // Move to the next line after printing the complete text
}
