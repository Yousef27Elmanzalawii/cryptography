String encryptRailFence(String text, int key) {
  if (key <= 1) return text;

  List<String> rail = List.filled(key, "");

  int row = 0;
  bool down = true;

  for (int i = 0; i < text.length; i++) {
    rail[row] += text[i];

    if (row == 0) {
      down = true;
    } else if (row == key - 1) {
      down = false;
    }

    row += down ? 1 : -1;
  }

  return rail.join();
}
String decryptRailFence(String cipher, int key) {
  if (key <= 1) return cipher;

  int n = cipher.length;

  List<int> pattern = List.filled(n, 0);

  int row = 0;
  bool down = true;

  for (int i = 0; i < n; i++) {
    pattern[i] = row;

    if (row == 0) {
      down = true;
    } else if (row == key - 1) {
      down = false;
    }

    row += down ? 1 : -1;
  }

  //
  List<String> result = List.filled(n, "");

  int index = 0;

  for (int r = 0; r < key; r++) {
    for (int i = 0; i < n; i++) {
      if (pattern[i] == r) {
        result[i] = cipher[index++];
      }
    }
  }

  return result.join();
}