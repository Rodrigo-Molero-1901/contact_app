import 'dart:async';
import 'dart:convert';

import 'package:contact_app/core/service/entities/contact_info.dart';
import 'package:contact_app/di/injection.dart';
import 'package:contact_app/shared/constants/app_files.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:objectbox/objectbox.dart';

class ContactApi {
  final Store _store;
  late final Box<ContactInfo> _box;
  late final Logger _logger;

  ContactApi(
    this._store,
  ) {
    _box = _store.box<ContactInfo>();
    _logger = injector<Logger>();
  }

  Future<List<ContactInfo>> _setMockDataAndGetContactList() async {
    _logger.i('Setting mock data and retrieving contact list');
    try {
      final jsonString = await rootBundle.loadString(AppFiles.exampleDataJson);
      final jsonData = json.decode(jsonString) as List<dynamic>;
      final mockedContacts = jsonData
          .map((e) => ContactInfo.fromJson(e as Map<String, dynamic>))
          .toList();
      final result = await _box.putAndGetManyAsync(mockedContacts);
      _logger.i('Contacts stored: ${result.length}');
      return result;
    } catch (e, stackTrace) {
      _logger.e(
        'Error on _setMockDataAndGetContactList(): $e',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  FutureOr<List<ContactInfo>> getContactList() async {
    _logger.i('Fetching contact list');
    try {
      final contactList = _box.getAll();
      _logger.d('Contact list retrieved: $contactList');
      if (contactList.isNotEmpty) {
        return contactList;
      } else {
        _logger.i('Contact list is empty. Setting mock data.');
        return await _setMockDataAndGetContactList();
      }
    } catch (e, stackTrace) {
      _logger.e(
        'Error on getContactList(): $e',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
