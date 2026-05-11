class RSA {
  /// =========================
  /// GCD
  /// =========================
  static int gcd(int a, int b) {
    while (b != 0) {
      int temp = b;
      b = a % b;
      a = temp;
    }
    return a;
  }

  /// =========================
  /// Prime Check
  /// =========================
  static bool isPrime(int n) {
    if (n < 2) return false;

    for (int i = 2; i * i <= n; i++) {
      if (n % i == 0) return false;
    }

    return true;
  }

  /// =========================
  /// Modular Inverse
  /// =========================
  static int modInverse(int e, int phi) {
    for (int d = 1; d < phi; d++) {
      if ((e * d) % phi == 1) return d;
    }
    return -1;
  }

  /// =========================
  /// Fast Power Mod
  /// =========================
  static int modPow(int base, int exp, int mod) {
    int result = 1;
    base %= mod;

    while (exp > 0) {
      if (exp % 2 == 1) {
        result = (result * base) % mod;
      }
      base = (base * base) % mod;
      exp ~/= 2;
    }

    return result;
  }

  /// =========================
  /// ENCRYPT
  /// =========================
  static String encrypt(String text, int p, int q, int e) {
    if (!isPrime(p) || !isPrime(q)) {
      return "p and q must be prime";
    }

    int n = p * q;
    int phi = (p - 1) * (q - 1);

    if (gcd(e, phi) != 1) {
      return "INVALID e (not coprime with phi)";
    }

    text = text.toUpperCase().replaceAll(" ", "");

    List<int> cipher = [];

    for (int i = 0; i < text.length; i++) {
      int m = text.codeUnitAt(i) - 65;

      if (m < 0 || m > 25) {
        return "Only A-Z allowed";
      }

      int c = modPow(m, e, n);
      cipher.add(c);
    }

    return cipher.join(" ");
  }

  /// =========================
  /// DECRYPT
  /// =========================
  static String decrypt(String cipher, int p, int q, int e) {
    if (!isPrime(p) || !isPrime(q)) {
      return "p and q must be prime";
    }

    int n = p * q;
    int phi = (p - 1) * (q - 1);

    int d = modInverse(e, phi);

    if (d == -1) {
      return "INVALID e";
    }

    List<String> parts = cipher.split(" ");
    StringBuffer result = StringBuffer();

    for (String part in parts) {
      if (part.trim().isEmpty) continue;

      int c = int.parse(part);
      int m = modPow(c, d, n);

      result.write(String.fromCharCode(m + 65));
    }

    return result.toString();
  }
}
