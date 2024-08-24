import 'package:contact_app/core/service/api/address_api.dart';
import 'package:contact_app/core/service/api/contact_api.dart';
import 'package:objectbox/objectbox.dart';

class Api {
  final Store _store;

  Api(this._store);

  ContactApi get contactApi => ContactApi(_store);

  AddressApi get addressApi => AddressApi(_store);
}
