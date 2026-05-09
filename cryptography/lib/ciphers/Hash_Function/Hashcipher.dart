class HashCipher {
  static String encryptHash(String input) {
    input = input.toUpperCase().replaceAll(RegExp(r'[^A-Z0-9]'), '');

    int hash = 0;
    int prime = 31;

    for (int i = 0; i < input.length; i++) {
      int value = input.codeUnitAt(i);

      hash = (hash * prime + value) % 1000000007;
    }

    return hash.toString();
  }
}