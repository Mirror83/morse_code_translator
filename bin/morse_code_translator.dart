import "package:morse_code_translator/lib.dart";
import "dart:io" show exit, stdin;

const translateMode = 1;
const encodeMode = 2;
const title = "Morse code translator and encoder.";
const exitChar = "x";

void main(List<String> arguments) {
  var morseCodeTree = MorseCodeTree();

  print(title);
  print("-" * title.length);

  print("(Type $exitChar to quit)");

  var mode = chooseMode();

  while (true) {
    if (mode == translateMode) {
      print("Enter the morse code sequence to translate:");
      final input = readUserInput();

      if (input == null) {
        print("Invalid input.");
        continue;
      }

      final translation = morseCodeTree.translate(input);
      if (translation == null) {
        print("Invalid morse code sequence.");
      } else {
        print("Translation: $translation");
      }
    } else if (mode == encodeMode) {
      print("Enter the sentence to translate (type 0 to exit):");
      final input = readUserInput(exitChar: "0");

      if (input == null) {
        print("Invalid input.");
        continue;
      }

      final codeSequence = morseCodeTree.encode(input);
      if (codeSequence == null) {
        print("Invalid sentence.");
      } else {
        print("Code sequence: $codeSequence");
      }
    } else {
      break;
    }
  }
}

String? readUserInput({String exitChar = "x"}) {
  final input = stdin.readLineSync()?.trim();

  if (input == exitChar) {
    print("Goodbye.");
    exit(0);
  }

  return input;
}

int chooseMode() {
  print("");
  print("Choose a mode: ");
  print("1. Translate");
  print("2. Encode");

  late int? mode;

  do {
    print("Choice: ");
    var modeInput = readUserInput(exitChar: exitChar);

    while (modeInput == null) {
      print("Invalid input. Try again.");
      print("Mode: ");
      modeInput = readUserInput(exitChar: exitChar);
    }

    print("Chosen mode: $modeInput");

    mode = int.tryParse(modeInput);

    if (isModeInvalid(mode)) {
      print("Please choose between 1 and 2 for the mode");
    }
  } while (isModeInvalid(mode));

  return mode!;
}

bool isModeInvalid(int? mode) {
  return mode == null || mode < translateMode || mode > encodeMode;
}
