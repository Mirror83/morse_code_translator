import "package:test/test.dart";
import "package:morse_code_translator/lib.dart";

void main() {
  late MorseCodeTree morseCodeTree;

  setUp(() {
    morseCodeTree = MorseCodeTree();
  });

  test("MorseCodeTree translates valid morse code sequences correctly", () {
    expect(morseCodeTree.translate("... --- ..."), equals("sos"));
    expect(morseCodeTree.translate("- .-. . . ...  .- .-. .  ..-. ..- -."),
        equals("trees are fun"));
  });

  test("MorseeCodeTree returns null for invalid morse code sequences", () {
    expect(morseCodeTree.translate("...........-"), isNull);
    expect(morseCodeTree.translate("... --- ...  "), isNull);
    expect(morseCodeTree.translate("ab"), isNull);
  });
}
