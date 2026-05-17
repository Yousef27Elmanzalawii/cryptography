class ColumnarTranspositionCipher {

  // ================= ENCRYPT =================
  static String encrypt(String text, String key) {

    text = text.replaceAll(" ", "").toUpperCase();
    key = key.toUpperCase();

    int cols = key.length;
    int rows = (text.length / cols).ceil();

    // إنشاء المصفوفة
    List<List<String>> matrix =
        List.generate(rows, (_) => List.filled(cols, 'X'));

    // ملء المصفوفة بالنص
    int index = 0;

    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {

        if (index < text.length) {
          matrix[r][c] = text[index];
          index++;
        }

      }
    }

    // ترتيب الأعمدة حسب الـ key
    List<MapEntry<int, String>> order = [];

    for (int i = 0; i < key.length; i++) {
      order.add(MapEntry(i, key[i]));
    }

    order.sort((a, b) => a.value.compareTo(b.value));

    // قراءة الأعمدة
    String cipher = "";

    for (var item in order) {

      int col = item.key;

      for (int r = 0; r < rows; r++) {
        cipher += matrix[r][col];
      }
    }

    return cipher;
  }

  // ================= DECRYPT =================
  static String decrypt(String cipher, String key) {

    cipher = cipher.toUpperCase();
    key = key.toUpperCase();

    int cols = key.length;
    int rows = (cipher.length / cols).ceil();

    List<List<String>> matrix =
        List.generate(rows, (_) => List.filled(cols, ''));

    // ترتيب الأعمدة
    List<MapEntry<int, String>> order = [];

    for (int i = 0; i < key.length; i++) {
      order.add(MapEntry(i, key[i]));
    }

    order.sort((a, b) => a.value.compareTo(b.value));

    // ملء الأعمدة
    int index = 0;

    for (var item in order) {

      int col = item.key;

      for (int r = 0; r < rows; r++) {

        if (index < cipher.length) {
          matrix[r][col] = cipher[index];
          index++;
        }

      }
    }

    // قراءة الصفوف
    String text = "";

    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        text += matrix[r][c];
      }
    }

    return text.replaceAll("X", "");
  }
}