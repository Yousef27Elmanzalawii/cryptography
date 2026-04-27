int modInverse(int a, int m) {
  for (int x = 1; x < m; x++) {
    if ((a * x) % m == 1) {
      return x;
    }
  }
  return -1; 
}

String affineEncrypt(String text, int a, int b) {
  const int m = 26;
  String result = '';

  text = text.toUpperCase();

  for (int i = 0; i < text.length; i++) {
    int charCode = text.codeUnitAt(i);

    if (charCode >= 65 && charCode <= 90) {
      int x = charCode - 65;
      int encrypted = (a * x + b) % m;
      result += String.fromCharCode(encrypted + 65);
    } else {
      result += text[i]; 
    }
  }

  return result;
}
String affineDecrypt(String text, int a, int b) {
  const int m = 26;
  String result = '';

  int aInv = modInverse(a, m);
  if (aInv == -1) {
    return "Invalid key: no modular inverse for a";
  }

  text = text.toUpperCase();

  for (int i = 0; i < text.length; i++) {
    int charCode = text.codeUnitAt(i);

    if (charCode >= 65 && charCode <= 90) {
      int y = charCode - 65;
      int decrypted = (aInv * (y - b)) % m;

      if (decrypted < 0) decrypted += m;

      result += String.fromCharCode(decrypted + 65);
    } else {
      result += text[i];
    }
  }

  return result;
}