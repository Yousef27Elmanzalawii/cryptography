class HillCipher2x2 {
  /// =========================
  /// 🔍 Validate Key
  /// =========================
  static bool isValidKey(List<List<int>> key) {
    int det = (key[0][0] * key[1][1]) -
        (key[0][1] * key[1][0]);

    det = ((det % 26) + 26) % 26;

    if (det == 0) return false;

    for (int i = 1; i < 26; i++) {
      if ((det * i) % 26 == 1) {
        return true;
      }
    }
    return false;
  }

  /// =========================
  /// 🔐 Encrypt
  /// =========================
  static String encrypt(String text, List<List<int>> key) {
    

    text = _prepareText(text);

    String result = '';

    for (int i = 0; i < text.length; i += 2) {
      int x = _charToNum(text[i]);
      int y = _charToNum(text[i + 1]);

      int c1 = (key[0][0] * x + key[0][1] * y) % 26;
      int c2 = (key[1][0] * x + key[1][1] * y) % 26;

      result += _numToChar(c1);
      result += _numToChar(c2);
    }

    return result;
  }

  /// =========================
  /// 🔓 Decrypt
  /// =========================
  static String decrypt(String text, List<List<int>> key) {
    if (!isValidKey(key)) return "INVALID KEY";

    text = _prepareText(text);

    int det = (key[0][0] * key[1][1]) -
        (key[0][1] * key[1][0]);

    det = ((det % 26) + 26) % 26;

    int detInv = _modInverse(det, 26);
    if (detInv == -1) return "INVALID KEY";

    List<List<int>> invKey = [
      [
        (key[1][1] * detInv) % 26,
        ((-key[0][1] + 26) * detInv) % 26
      ],
      [
        ((-key[1][0] + 26) * detInv) % 26,
        (key[0][0] * detInv) % 26
      ],
    ];

    String result = '';

    for (int i = 0; i < text.length; i += 2) {
      int x = _charToNum(text[i]);
      int y = _charToNum(text[i + 1]);

      int p1 = (invKey[0][0] * x + invKey[0][1] * y) % 26;
      int p2 = (invKey[1][0] * x + invKey[1][1] * y) % 26;

      result += _numToChar(p1);
      result += _numToChar(p2);
    }

    return result;
  }

  /// =========================
  /// 🧠 Helpers
  /// =========================

  static String _prepareText(String text) {
    text = text.toUpperCase().replaceAll(RegExp(r'[^A-Z]'), '');
    if (text.length % 2 != 0) text += 'X';
    return text;
  }

  static int _charToNum(String c) => c.codeUnitAt(0) - 65;

  static String _numToChar(int n) => String.fromCharCode(n + 65);

  static int _modInverse(int a, int m) {
    for (int i = 1; i < m; i++) {
      if ((a * i) % m == 1) return i;
    }
    return -1;
  }
}