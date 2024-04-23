import "package:test/test.dart";
import "package:morse_code_translator/lib.dart";

void main() {
  late MorseCodeTree morseCodeTree;

  setUp(() {
    morseCodeTree = MorseCodeTree();
  });

  test(
      "MorseCodeTree.translate translates valid morse code sequences correctly",
      () {
    expect(morseCodeTree.translate("... --- ..."), equals("sos"));
    expect(morseCodeTree.translate("- .-. . . ...  .- .-. .  ..-. ..- -."),
        equals("trees are fun"));
    expect(
        morseCodeTree.translate(
            "- .... .  --.- ..- .. -.-. -.-  .-.. .- --.. -.--  -... .-. --- .-- -.  ..-. --- -..-  .--- ..- -- .--. . -..  --- ...- . .-.  - .... .  ..-. . -. -.-. ."),
        "the quick lazy brown fox jumped over the fence");
  });

  test("MorseeCodeTree.translate returns null for invalid morse code sequences",
      () {
    expect(morseCodeTree.translate("...........-"), isNull);
    expect(morseCodeTree.translate("ab"), isNull);
  });

  test("MorseCodeTree.encode encodes valid sentences", () {
    expect(morseCodeTree.encode("sos"), "... --- ...");
    expect(morseCodeTree.encode("Trees are fun"),
        "- .-. . . ...  .- .-. .  ..-. ..- -.");

    final sentence = "The quick lazy brown fox jumped over the fence";

    expect(morseCodeTree.encode(sentence),
        "- .... .  --.- ..- .. -.-. -.-  .-.. .- --.. -.--  -... .-. --- .-- -.  ..-. --- -..-  .--- ..- -- .--. . -..  --- ...- . .-.  - .... .  ..-. . -. -.-. .");
  });

  test("MorseCodeTree.encode returns null for invalid sentences", () {
    expect(morseCodeTree.encode("Hi!"), isNull);
    expect(morseCodeTree.encode("Meet me at 1:00 p.m"), isNull);
    expect(morseCodeTree.translate("Where's the location?"), isNull);
  });
}
