import 'dart:io';

void main() async {
  // Start playing audio in the background
  //playAudio();

  // Wait for audio to finish before proceeding with the story
  await Future.delayed(Duration(seconds: 10)); // Adjust the delay as needed

  print("start");
  int standart = 50;
  int half = standart * 2;
  int slow = half * 2;

  // Debug to jump to questions
  stdout.write("Debug?");
  var debugg = await stdin.readLineSync();
  switch (debugg) {
    case ("1"):
      firstquestion();
      break;
    default:
      // First Questions
      await printletterbyletter("Its Dark", standart);
      await printletterbyletter("But you must go on", standart);
      await printletterbyletter("Your Heart is beating slow", half);
      await printletterbyletter("..............", slow);
      await printletterbyletter("You see a small cabin.....", half);
      await Future.delayed(Duration(seconds: 1));
      await printletterbyletter("Its Dark....", half);
      await Future.delayed(Duration(seconds: 2));
      await printletterbyletter("Its cold....", half);
      await Future.delayed(Duration(milliseconds: 50));
      await printletterbyletter("What will you do?", half);
      firstquestion();
  }
}

/*//????????????????????????????????????????
void playAudio() {
  AudioPlayer audioPlayer = AudioPlayer();

  // Local file path
 
  String localFilePath = 'C:/DEV/Home/Adventure/Music/Testaudio.mp4.mp3';

  // Play the local audio file
  audioPlayer.play(localFilePath);
}
/?????????????????????????????????????*/
Future<void> printletterbyletter(String text, int time) async {
  for (int i = 0; i < text.length; i++) {
    stdout.write(text[i]);
    await Future.delayed(Duration(milliseconds: time));
  }

  print(""); // Move to the next line after printing the complete text
}

void firstquestion() {
  String firstage = "start";
  print("[1] Go in");
  print("[2] There must be a better place");
  print("[3] Save Game");
  stdout.write("");
  var firstanswer = stdin.readLineSync();
  switch (firstanswer) {
    case ("1"):
      // Jump to file inthecabin
      inthecabin();
      break;
    case ("2"):
      // Jump to file notinthecabin
      notinthecabin();
      break;
    case ("3"):
      // Save game => Function SAVEGAME
      savegame(firstage);
      break;
  }
}

void inthecabin() {
  // Code for the inthecabin scenario
  print("You are in the cabin!");
}

void notinthecabin() {
  // Code for the notinthecabin scenario
  print("You are not in the cabin!");
}

void savegame(String currentstep) {
  String savegame = currentstep;
  print("Game saved. You are at level: $savegame");
  createAndWriteToFile("C:/DEV/Home/Adventure/Savegame/savegame.txt", savegame);
}

void createAndWriteToFile(String fileName, String content) {
  File file = File(fileName);

  // Create the file if it doesn't exist
  if (!file.existsSync()) {
    file.createSync();
  }

  // Write content to the file
  file.writeAsStringSync(content);

  print('File "$fileName" created with content: "$content"');
}
