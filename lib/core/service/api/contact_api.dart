import 'dart:async';
import 'dart:convert';

import 'package:contact_app/core/service/entities/address.dart';
import 'package:contact_app/core/service/entities/contact_info.dart';
import 'package:contact_app/core/utils/logger.dart';
import 'package:contact_app/objectbox.g.dart';
import 'package:contact_app/shared/constants/app_files.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

class ContactApi {
  final Store _store;
  late final Box<ContactInfo> _contactBox;
  late final Box<Address> _addressBox;
  late final Logger _logger;

  ContactApi(
    this._store,
  ) {
    _contactBox = _store.box<ContactInfo>();
    _addressBox = _store.box<Address>();
    _logger = LoggerUtils.instance;
  }

  Future<List<ContactInfo>> _setMockDataAndGetContactList() async {
    try {
      // Loading contact data and saving into contact box
      final jsonString = await rootBundle.loadString(AppFiles.exampleDataJson);
      final jsonData = json.decode(jsonString) as List<dynamic>;
      final mockedContacts = jsonData
          .map((e) => ContactInfo.fromJson(e as Map<String, dynamic>))
          .toList();
      final insertedContacts =
          await _contactBox.putAndGetManyAsync(mockedContacts);
      _logger.i('Contacts stored: ${mockedContacts.length}');

      // Saving address data for each contact
      final List<Address> mockedAddresses = [];
      for (int i = 0; i < jsonData.length; i++) {
        final contactJson = jsonData[i] as Map<String, dynamic>;
        final addressesJson = contactJson['addresses'] as List<dynamic>;
        final contactId = insertedContacts[i].objectId;
        final contactAddresses = addressesJson.map((e) {
          final address = Address.fromJson(e as Map<String, dynamic>);
          address.contact.targetId = contactId;
          return address;
        }).toList();
        mockedAddresses.addAll(contactAddresses);
      }
      await _addressBox.putManyAsync(mockedAddresses);
      _logger.i('Addresses stored: ${mockedAddresses.length}');

      final query = _contactBox.query().order(ContactInfo_.firstName).build();
      final sortedContacts = query.find();
      query.close();

      return sortedContacts;
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
    try {
      final query = _contactBox.query().order(ContactInfo_.firstName).build();
      final contactList = query.find();
      query.close();

      if (contactList.isNotEmpty) {
        _logger.d('Contact list retrieved: $contactList');
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

  Future<ContactInfo?> getContactInfo({required String contactId}) async {
    try {
      final query =
          _contactBox.query(ContactInfo_.contactId.equals(contactId)).build();
      final contactInfo = await query.findFirstAsync();
      query.close();

      _logger.d('Retrieving contact with id $contactId from database');
      return contactInfo;
    } catch (e, stackTrace) {
      _logger.e(
        'Error on getContactInfo(): $e',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<ContactInfo> createContact({required ContactInfo contactInfo}) async {
    try {
      _logger.d('Creating contact in database: $contactInfo');
      return await _contactBox.putAndGetAsync(contactInfo,
          mode: PutMode.insert);
    } catch (e, stackTrace) {
      _logger.e(
        'Error on createContact(): $e',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<ContactInfo> updateContact({required ContactInfo contactInfo}) async {
    try {
      _logger.d('Updating contact in database: $contactInfo');
      return await _contactBox.putAndGetAsync(contactInfo,
          mode: PutMode.update);
    } catch (e, stackTrace) {
      _logger.e(
        'Error on updateContact(): $e',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<bool> deleteContact({required int objectId}) async {
    try {
      _logger.d('Deleting contact with id $objectId from database');
      return await _contactBox.removeAsync(objectId);
    } catch (e, stackTrace) {
      _logger.e(
        'Error on deleteContact(): $e',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
