class HillCipher3x3 {
  /// =========================
  /// 🔍 Validate Key
  /// =========================
  static bool isValidKey(List<List<int>> key) {
    int det = _determinant(key);

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
    text = _prepare(text);

    String result = '';

    for (int i = 0; i < text.length; i += 3) {
      List<int> v = [
        _charToNum(text[i]),
        _charToNum(text[i + 1]),
        _charToNum(text[i + 2]),
      ];

      for (int row = 0; row < 3; row++) {
        int val =
            (key[row][0] * v[0] +
             key[row][1] * v[1] +
             key[row][2] * v[2]) %
            26;

        result += _numToChar(val);
      }
    }

    return result;
  }

  /// =========================
  /// 🔓 Decrypt
  /// =========================
  static String decrypt(String text, List<List<int>> key) {
    if (!isValidKey(key)) return "INVALID KEY";

    text = _prepare(text);

    int det = _determinant(key);
    det = ((det % 26) + 26) % 26;

    int detInv = _modInverse(det);
    if (detInv == -1) return "INVALID KEY";

    List<List<int>> inv = _inverseMatrix(key, detInv);

    String result = '';

    for (int i = 0; i < text.length; i += 3) {
      List<int> v = [
        _charToNum(text[i]),
        _charToNum(text[i + 1]),
        _charToNum(text[i + 2]),
      ];

      for (int row = 0; row < 3; row++) {
        int val =
            (inv[row][0] * v[0] +
             inv[row][1] * v[1] +
             inv[row][2] * v[2]) %
            26;

        result += _numToChar(val);
      }
    }

    return result;
  }

  /// =========================
  /// 🧠 Helpers
  /// =========================

  static String _prepare(String text) {
    text = text.toUpperCase().replaceAll(RegExp(r'[^A-Z]'), '');

    while (text.length % 3 != 0) {
      text += 'X';
    }
    return text;
  }

  static int _charToNum(String c) => c.codeUnitAt(0) - 65;

  static String _numToChar(int n) => String.fromCharCode(n + 65);

  static int _determinant(List<List<int>> m) {
    return m[0][0] *
            (m[1][1] * m[2][2] - m[1][2] * m[2][1]) -
        m[0][1] *
            (m[1][0] * m[2][2] - m[1][2] * m[2][0]) +
        m[0][2] *
            (m[1][0] * m[2][1] - m[1][1] * m[2][0]);
  }

  static int _modInverse(int a) {
    for (int i = 1; i < 26; i++) {
      if ((a * i) % 26 == 1) return i;
    }
    return -1;
  }

  static List<List<int>> _inverseMatrix(
      List<List<int>> m, int detInv) {
    List<List<int>> adj = [
      [
        (m[1][1] * m[2][2] - m[1][2] * m[2][1]),
        -(m[0][1] * m[2][2] - m[0][2] * m[2][1]),
        (m[0][1] * m[1][2] - m[0][2] * m[1][1]),
      ],
      [
        -(m[1][0] * m[2][2] - m[1][2] * m[2][0]),
        (m[0][0] * m[2][2] - m[0][2] * m[2][0]),
        -(m[0][0] * m[1][2] - m[0][2] * m[1][0]),
      ],
      [
        (m[1][0] * m[2][1] - m[1][1] * m[2][0]),
        -(m[0][0] * m[2][1] - m[0][1] * m[2][0]),
        (m[0][0] * m[1][1] - m[0][1] * m[1][0]),
      ],
    ];

    List<List<int>> inv = List.generate(
      3,
      (i) => List.generate(3, (j) {
        int val = adj[j][i] * detInv;
        return ((val % 26) + 26) % 26;
      }),
    );

    return inv;
  }
}