import 'dart:async';
import 'dart:convert';

import 'package:contact_app/core/service/entities/contact_info.dart';
import 'package:flutter/services.dart';
import 'package:objectbox/objectbox.dart';

class ContactApi {
  final Store _store;
  late final Box<ContactInfo> _box;

  ContactApi(
    this._store,
  ) {
    _box = _store.box<ContactInfo>();
  }

  Future<List<ContactInfo>> _setMockDataAndGetContactList() async {
    final jsonString =
        await rootBundle.loadString('assets/json/example_data.json');
    final jsonData = json.decode(jsonString) as List<dynamic>;
    final mockedContacts = jsonData
        .map((e) => ContactInfo.fromJson(e as Map<String, dynamic>))
        .toList();
    return await _box.putAndGetManyAsync(mockedContacts);
  }

  FutureOr<List<ContactInfo>> getContactList() async {
    final boxContent = _box.getAll();
    if (boxContent.isNotEmpty) {
      return boxContent;
    } else {
      return await _setMockDataAndGetContactList();
    }
  }
}
