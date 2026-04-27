String encryptSubstitution(String plaintext) {
  String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  String substitute = "QWERTYUIOPASDFGHJKLZXCVBNM";

  plaintext = plaintext.toUpperCase();

  String ciphertext = "";

  for (int i = 0; i < plaintext.length; i++) {
    String char = plaintext[i];

    int index = alphabet.indexOf(char);

    if (index != -1) {
      ciphertext += substitute[index];
    } else {
      ciphertext += char;
    }
  }
  return ciphertext;
}
String decryptSubstitution(String ciphertext) {
  String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  String substitute = "QWERTYUIOPASDFGHJKLZXCVBNM";
  ciphertext = ciphertext.toUpperCase();

  String plaintext = "";

  for (int i = 0; i < ciphertext.length; i++) {
    String char = ciphertext[i];

    int index = substitute.indexOf(char);

    if (index != -1) {
      plaintext += alphabet[index];
    } else {
      plaintext += char;
    }
  }

  return plaintext;
}