import "package:morse_code_translator/lib.dart";
import "dart:io" show stdin;

void main(List<String> arguments) {
  var morseCodeTree = MorseCodeTree();

  const title = "Morse code translator.";
  print(title);
  print("_" * title.length);

  while (true) {
    print("Enter the morse code sequence to translate (type x to quit):");
    final input = stdin.readLineSync();

    if (input == null) {
      print("Invalid input.");
      continue;
    }

    if (input == "x") {
      print("Goodbye!");
      break;
    }

    final translation = morseCodeTree.translate(input);
    if (translation == null) {
      print("Invalid morse code sequence.");
    } else {
      print("Translation: $translation");
    }
  }
}
