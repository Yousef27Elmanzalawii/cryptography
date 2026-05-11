class DiffieHellman {
  /// =========================
  /// 🔢 Modular Power
  /// =========================
  static bool isPrime(BigInt n) {
    if (n <= BigInt.one) return false;

    for (BigInt i = BigInt.from(2); i * i <= n; i += BigInt.one) {
      if (n % i == BigInt.zero) {
        return false;
      }
    }

    return true;
  }

  static int deriveRailKey(BigInt sharedKey) {
    return sharedKey.toInt();
  }

  static BigInt modPow(BigInt base, BigInt exp, BigInt mod) {
    BigInt result = BigInt.one;

    while (exp > BigInt.zero) {
      if (exp % BigInt.from(2) == BigInt.one) {
        result = (result * base) % mod;
      }

      exp = exp ~/ BigInt.from(2);
      base = (base * base) % mod;
    }

    return result;
  }

  /// =========================
  /// 🔐 Generate Public Key
  /// =========================
  static BigInt generatePublicKey(
    BigInt prime,
    BigInt primitiveRoot,
    BigInt privateKey,
  ) {
    return modPow(primitiveRoot, privateKey, prime);
  }

  /// =========================
  /// 🤝 Generate Shared Secret
  /// =========================
  static BigInt generateSharedSecret(
    BigInt receivedPublicKey,
    BigInt privateKey,
    BigInt prime,
  ) {
    return modPow(receivedPublicKey, privateKey, prime);
  }
}
