String encryptOTP(String plaintext, String key) {
  plaintext = plaintext.toUpperCase();
  key = key.toUpperCase();

  String result = "";

  for (int i = 0; i < plaintext.length; i++) {
    int p = plaintext.codeUnitAt(i) - 65;
    int k = key.codeUnitAt(i) - 65;

    int c = (p + k) % 26;

    result += String.fromCharCode(c + 65);
  }

  return result;
}

String decryptOTP(String ciphertext, String key) {
  ciphertext = ciphertext.toUpperCase();
  key = key.toUpperCase();

  String result = "";

  for (int i = 0; i < ciphertext.length; i++) {
    int c = ciphertext.codeUnitAt(i) - 65;
    int k = key.codeUnitAt(i) - 65;

    int p = (c - k + 26) % 26;

    result += String.fromCharCode(p + 65);
  }

  return result;
}