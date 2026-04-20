String vigenereEncrypt(String text, String key) {
  String result = '';
  int keyIndex = 0;

  for (int i = 0; i < text.length; i++) {
    int charCode = text.codeUnitAt(i);

    
    if (charCode >= 65 && charCode <= 90) {
      int base = 65;

      int textValue = charCode - base;
      int keyValue = key.toUpperCase().codeUnitAt(keyIndex % key.length) - 65;

      int encryptedValue = (textValue + keyValue) % 26;

      result += String.fromCharCode(encryptedValue + base);
      keyIndex++;
    }


    else if (charCode >= 97 && charCode <= 122) {
      int base = 97;

      int textValue = charCode - base;
      int keyValue = key.toUpperCase().codeUnitAt(keyIndex % key.length) - 65;

      int encryptedValue = (textValue + keyValue) % 26;

      result += String.fromCharCode(encryptedValue + base);
      keyIndex++;
    }

    else {
      result += text[i];
    }
  }

  return result;
}

String vigenereDecrypt(String text, String key) {
  String result = '';
  int keyIndex = 0;

  for (int i = 0; i < text.length; i++) {
    int charCode = text.codeUnitAt(i);

    // uppercase
    if (charCode >= 65 && charCode <= 90) {
      int base = 65;

      int textValue = charCode - base;
      int keyValue = key.toUpperCase().codeUnitAt(keyIndex % key.length) - 65;

      int decryptedValue = (textValue - keyValue + 26) % 26;

      result += String.fromCharCode(decryptedValue + base);
      keyIndex++;
    }

    
    else if (charCode >= 97 && charCode <= 122) {
      int base = 97;

      int textValue = charCode - base;
      int keyValue = key.toUpperCase().codeUnitAt(keyIndex % key.length) - 65;

      int decryptedValue = (textValue - keyValue + 26) % 26;

      result += String.fromCharCode(decryptedValue + base);
      keyIndex++;
    }

    else {
      result += text[i];
    }
  }

  return result;
}