class _BinTreeNode<T> {
  T data;
  _BinTreeNode<T>? left;
  _BinTreeNode<T>? right;

  _BinTreeNode(this.data);
}

class MorseCodeTree {
  late _BinTreeNode<String> _root;
  static const _sequenceMap = {
    "a": ".-",
    "b": "-...",
    "c": "-.-.",
    "d": "-..",
    "e": ".",
    "f": "..-.",
    "g": "--.",
    "h": "....",
    "i": "..",
    "j": ".---",
    "k": "-.-",
    "l": ".-..",
    "m": "--",
    "n": "-.",
    "o": "---",
    "p": ".--.",
    "q": "--.-",
    "r": ".-.",
    "s": "...",
    "t": "-",
    "u": "..-",
    "v": "...-",
    "w": ".--",
    "x": "-..-",
    "y": "-.--",
    "z": "--.."
  };

  MorseCodeTree() {
    _buildDecisionTree();
  }

  void _buildDecisionTree() {
    _root = _BinTreeNode("");
    _BinTreeNode<String>? current = _root;

    for (var MapEntry(key: letter, value: codeSeq) in _sequenceMap.entries) {
      current = _root;

      for (int i = 0; i < codeSeq.length; i++) {
        if (codeSeq[i] == ".") {
          current!.left ??= _BinTreeNode("");

          current = current.left;
        } else if (codeSeq[i] == "-") {
          current!.right ??= _BinTreeNode("");

          current = current.right;
        }
      }

      current!.data = letter;
    }
  }

  /// Translate the Morse Code sequence [codeSequence] into a
  /// to its equivalent character sequence.
  /// If [codeSequence] is invalid, null is returned.
  ///
  ///
  /// Code sequence should be a string of morse code symbols separated
  /// by a space for each character of a word and two spaces between words in a
  /// sentence.
  ///
  ///
  /// Examples
  ///
  /// ```dart
  /// final morseCodeTree = MorseCodeTree();
  ///
  /// morseCodeTree.translate("... --- ...");
  /// >>> "sos"
  /// morseCodeTree.translate("- .-. . . ...  .- .-. .  ..-. ..- -.");
  /// >>> "trees are fun"
  /// morseCodeTree.translate("...........-");
  /// >>> null
  /// ```
  String? translate(String codeSequence) {
    _BinTreeNode<String>? current;
    final words = codeSequence.split("  ");
    var output = "";
    for (final word in words) {
      final codeSeqList = word.split(" ");

      for (final codeSeq in codeSeqList) {
        current = _root;
        for (int i = 0; i < codeSeq.length; i++) {
          if (codeSeq[i] == ".") {
            current = current?.left;
          } else if (codeSeq[i] == "-") {
            current = current?.right;
          } else {
            return null;
          }
        }

        if (current == null) {
          return null;
        }

        output += current.data;
      }

      output += " ";
    }

    return output.trimRight();
  }

  /// Translates [sentence] into a morse code sequence.
  ///
  /// Returns null if the sentence contains characters that are not among the
  /// 26 letters of the alphabet (ignoring case)
  ///
  /// The morse code sequence returned is as described in the comments for
  /// [MorseCodeTree.translate] above.
  ///
  /// Examples
  /// ```dart
  /// final morseCodeTree = MorseCodeTree();
  ///
  /// morseCodeTree.encode("sos");
  /// >>> "... --- ..."
  ///
  /// morseCodeTree.encode("Trees are fun");
  /// >>> "- .-. . . ...  .- .-. .  ..-. ..- -."
  ///
  /// morseCodeTree.encode("Hi!");
  /// >>> null
  ///
  /// ```
  String? encode(String sentence) {
    String output = "";

    final words = sentence.toLowerCase().split(" ");

    for (final word in words) {
      for (int i = 0; i < word.length; i++) {
        final character = word[i];
        if (_sequenceMap.containsKey(character)) {
          output += _sequenceMap[character]!;
          output += " ";
        } else {
          return null;
        }
      }

      output += " ";
    }

    return output.trimRight();
  }
}
