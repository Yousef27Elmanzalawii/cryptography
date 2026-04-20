String processOTP(String text, String key, bool isEncrypt) {
  // 1. تنظيف النص والمفتاح (حروف كبيرة فقط)
  String input = text.toUpperCase().replaceAll(RegExp(r'[^A-Z]'), '');
  String pad = key.toUpperCase().replaceAll(RegExp(r'[^A-Z]'), '');

  if (input.isEmpty || pad.isEmpty) return "";
  
  // شرط أساسي في OTP: المفتاح يجب أن يكون بطول النص أو أطول
  if (pad.length < input.length) return "ERROR: KEY TOO SHORT";

  String result = "";

  for (int i = 0; i < input.length; i++) {
    // تحويل الحرف لرقم (A = 0, B = 1, ...)
    int p = input.codeUnitAt(i) - 65;
    int k = pad.codeUnitAt(i) - 65;

    int processed;
    if (isEncrypt) {
      // التشفير: (النص + المفتاح) % 26
      processed = (p + k) % 26;
    } else {
      // فك التشفير: (النص - المفتاح + 26) % 26
      processed = (p - k + 26) % 26;
    }

    result += String.fromCharCode(processed + 65);
  }

  return result;
}