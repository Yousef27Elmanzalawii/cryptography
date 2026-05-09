String columnarEncrypt(String text, String key) {
  text = text.replaceAll(' ', '');
  int cols = key.length;
  int rows = (text.length / cols).ceil();

  List<List<String>> grid =
      List.generate(rows, (_) => List.filled(cols, ''));

  // fill grid row-wise
  int index = 0;
  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      if (index < text.length) {
        grid[r][c] = text[index];
        index++;
      } else {
        grid[r][c] = 'X'; // padding
      }
    }
  }

  // sort key with indexes
  List<int> order = List.generate(cols, (i) => i);
  order.sort((a, b) => key[a].compareTo(key[b]));

  // read column-wise
  String result = '';
  for (int c in order) {
    for (int r = 0; r < rows; r++) {
      result += grid[r][c];
    }
  }

  return result;
}
String columnarDecrypt(String cipher, String key) {
  int cols = key.length;
  int rows = (cipher.length / cols).ceil();

  List<List<String>> grid =
      List.generate(rows, (_) => List.filled(cols, ''));

  // sort key indexes
  List<int> order = List.generate(cols, (i) => i);
  order.sort((a, b) => key[a].compareTo(key[b]));

  // fill column-wise
  int index = 0;
  for (int c in order) {
    for (int r = 0; r < rows; r++) {
      if (index < cipher.length) {
        grid[r][c] = cipher[index];
        index++;
      }
    }
  }

  // read row-wise
  String result = '';
  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      result += grid[r][c];
    }
  }

  return result.replaceAll('X', '');
}