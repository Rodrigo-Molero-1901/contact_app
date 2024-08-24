import 'package:contact_app/objectbox.g.dart';

abstract class DatabaseUtils {
  static late final Store _store;

  static Store get storeInstance => _store;

  static Future<void> init() async {
    _store = await openStore();
  }

  static void close() {
    _store.close();
  }
}
