import 'dart:math';

abstract class Utils {
  static String generateRandomContactID() {
    const String chars = 'abcdef0123456789';
    Random random = Random();
    String generateSegment(int length) {
      return List.generate(
          length, (index) => chars[random.nextInt(chars.length)]).join();
    }

    return '${generateSegment(8)}-${generateSegment(4)}-${generateSegment(4)}-${generateSegment(4)}-${generateSegment(12)}';
  }
}
