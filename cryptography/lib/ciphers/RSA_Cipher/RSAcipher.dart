import 'dart:math';

BigInt modPow(BigInt base, BigInt exp, BigInt mod) {
  BigInt result = BigInt.one;

  while (exp > BigInt.zero) {
    if (exp.isOdd) {
      result = (result * base) % mod;
    }
    base = (base * base) % mod;
    exp = exp ~/ BigInt.two;
  }

  return result;
}
BigInt gcd(BigInt a, BigInt b) {
  while (b != BigInt.zero) {
    BigInt temp = b;
    b = a % b;
    a = temp;
  }
  return a;
}
BigInt modInverse(BigInt e, BigInt phi) {
  BigInt t = BigInt.zero;
  BigInt newT = BigInt.one;
  BigInt r = phi;
  BigInt newR = e;

  while (newR != BigInt.zero) {
    BigInt q = r ~/ newR;

    (t, newT) = (newT, t - q * newT);
    (r, newR) = (newR, r - q * newR);
  }

  if (r > BigInt.one) {
    throw Exception("Not invertible");
  }

  if (t < BigInt.zero) {
    t += phi;
  }

  return t;
}
class RSA {
  late BigInt n, e, d, phi;

  void generateKeys(BigInt p, BigInt q) {
    n = p * q;
    phi = (p - BigInt.one) * (q - BigInt.one);

    e = BigInt.from(65537);

    while (gcd(e, phi) != BigInt.one) {
      e += BigInt.two;
    }

    d = modInverse(e, phi);
  }

  BigInt encrypt(BigInt m) {
    return modPow(m, e, n);
  }

  BigInt decrypt(BigInt c) {
    return modPow(c, d, n);
  }
}