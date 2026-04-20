String caesarEncrypt(String text, int shift) {
  String result = "";

  for (int i = 0; i < text.length; i++) {
    int charCode = text.codeUnitAt(i);

    if (charCode >= 97 && charCode <= 122) {
      result += String.fromCharCode(
        (charCode - 97 + shift) % 26 + 97,
      );
    }
    else if (charCode >= 65 && charCode <= 90) {
      result += String.fromCharCode(
        (charCode - 65 + shift) % 26 + 65,
      );
    }

    else {
      result += text[i];
    }
  }

  return result;
}

String caesarDecrypt(String text, int shift) {
  return caesarEncrypt(text, 26 - (shift % 26));
}