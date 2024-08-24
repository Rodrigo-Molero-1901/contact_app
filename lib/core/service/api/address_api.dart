import 'package:contact_app/core/service/entities/address.dart';
import 'package:contact_app/core/utils/logger.dart';
import 'package:contact_app/objectbox.g.dart';
import 'package:logger/logger.dart';

class AddressApi {
  final Store _store;
  late final Box<Address> _addressBox;
  late final Logger _logger;

  AddressApi(
    this._store,
  ) {
    _addressBox = _store.box<Address>();
    _logger = LoggerUtils.instance;
  }

  Future<List<Address>> insertAddresses(
      {required List<Address> addresses}) async {
    try {
      // Using the same function for creating or updating addresses to save time
      // in implementing logic to differentiate the function's put mode value

      final contactId = addresses.first.contact.targetId;
      final contactAddresses =
          _addressBox.query(Address_.contact.equals(contactId)).build().find();
      if (contactAddresses.isNotEmpty) {
        _logger.d('Deleting addresses for contact with id: $contactId');
        await _addressBox
            .removeManyAsync(contactAddresses.map((e) => e.objectId).toList());
      }

      _logger
          .d('Creating addresses in database for contact with id: $contactId');
      return await _addressBox.putAndGetManyAsync(addresses);
    } catch (e, stackTrace) {
      _logger.e(
        'Error on createAddresses(): $e',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<bool> deleteAddresses({required List<int> addressObjectIds}) async {
    try {
      _logger.d('Deleting addresses from database');
      await _addressBox.removeManyAsync(addressObjectIds);
      return true;
    } catch (e, stackTrace) {
      _logger.e(
        'Error on deleteAddresses(): $e',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
