import 'package:contact_app/core/service/api/api.dart';
import 'package:contact_app/core/service/manager/address_api_manager.dart';
import 'package:contact_app/core/service/manager/contact_api_manager.dart';
import 'package:contact_app/core/utils/database.dart';
import 'package:objectbox/objectbox.dart';

class ApiManager {
  late final Store _store;
  late final Api _api;

  ApiManager() {
    _store = DatabaseUtils.storeInstance;
    _api = Api(_store);
  }

  ContactApiManager get contactApiManager => ContactApiManager(_api);

  AddressApiManager get addressApiManager => AddressApiManager(_api);
}
