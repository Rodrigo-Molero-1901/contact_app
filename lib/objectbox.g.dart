// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'core/service/entities/contact_info.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(4, 7552741730109386070),
      name: 'ContactInfo',
      lastPropertyId: const obx_int.IdUid(10, 5262197710398999067),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 3779523350817345169),
            name: 'objectId',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 3892488427364376739),
            name: 'contactId',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 2729979608481710779),
            name: 'firstName',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 8197295544323221853),
            name: 'lastName',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 7573306745966624206),
            name: 'phoneNumber',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 859687032220263981),
            name: 'streetAddress1',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 1507672198482119889),
            name: 'streetAddress2',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(8, 1778253952834467245),
            name: 'city',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(9, 4214077062018903117),
            name: 'state',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(10, 5262197710398999067),
            name: 'zipCode',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(getObjectBoxModel(),
      directory: directory ?? (await defaultStoreDirectory()).path,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(4, 7552741730109386070),
      lastIndexId: const obx_int.IdUid(0, 0),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [
        624948712207558715,
        5702767000179554303,
        8761591450415681757
      ],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        5165546764973806093,
        7023186708467587733,
        3071514288189538113,
        728493765245066699,
        499230094000917913,
        1333298475943622390,
        5899146766531563348,
        940464643967818717,
        2101488791809191933,
        5153332657598414408,
        2164215858564340456,
        844311314231345452,
        3359550499976194649,
        7829472556115548222,
        2255084664259633718,
        4652626485668075066,
        2102893289537902522,
        4763966120872041411,
        164834524138098400,
        7268566597532744264,
        6027820855486528700,
        8085009120196536231,
        7351669229056519673,
        9180691930032347989
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    ContactInfo: obx_int.EntityDefinition<ContactInfo>(
        model: _entities[0],
        toOneRelations: (ContactInfo object) => [],
        toManyRelations: (ContactInfo object) => {},
        getId: (ContactInfo object) => object.objectId,
        setId: (ContactInfo object, int id) {
          object.objectId = id;
        },
        objectToFB: (ContactInfo object, fb.Builder fbb) {
          final contactIdOffset = fbb.writeString(object.contactId);
          final firstNameOffset = fbb.writeString(object.firstName);
          final lastNameOffset = fbb.writeString(object.lastName);
          final phoneNumberOffset = fbb.writeString(object.phoneNumber);
          final streetAddress1Offset = fbb.writeString(object.streetAddress1);
          final streetAddress2Offset = fbb.writeString(object.streetAddress2);
          final cityOffset = fbb.writeString(object.city);
          final stateOffset = fbb.writeString(object.state);
          final zipCodeOffset = fbb.writeString(object.zipCode);
          fbb.startTable(11);
          fbb.addInt64(0, object.objectId);
          fbb.addOffset(1, contactIdOffset);
          fbb.addOffset(2, firstNameOffset);
          fbb.addOffset(3, lastNameOffset);
          fbb.addOffset(4, phoneNumberOffset);
          fbb.addOffset(5, streetAddress1Offset);
          fbb.addOffset(6, streetAddress2Offset);
          fbb.addOffset(7, cityOffset);
          fbb.addOffset(8, stateOffset);
          fbb.addOffset(9, zipCodeOffset);
          fbb.finish(fbb.endTable());
          return object.objectId;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final objectIdParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final contactIdParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final firstNameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final lastNameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final phoneNumberParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 12, '');
          final streetAddress1Param =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 14, '');
          final streetAddress2Param =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 16, '');
          final cityParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 18, '');
          final stateParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 20, '');
          final zipCodeParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 22, '');
          final object = ContactInfo(
              objectId: objectIdParam,
              contactId: contactIdParam,
              firstName: firstNameParam,
              lastName: lastNameParam,
              phoneNumber: phoneNumberParam,
              streetAddress1: streetAddress1Param,
              streetAddress2: streetAddress2Param,
              city: cityParam,
              state: stateParam,
              zipCode: zipCodeParam);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [ContactInfo] entity fields to define ObjectBox queries.
class ContactInfo_ {
  /// See [ContactInfo.objectId].
  static final objectId =
      obx.QueryIntegerProperty<ContactInfo>(_entities[0].properties[0]);

  /// See [ContactInfo.contactId].
  static final contactId =
      obx.QueryStringProperty<ContactInfo>(_entities[0].properties[1]);

  /// See [ContactInfo.firstName].
  static final firstName =
      obx.QueryStringProperty<ContactInfo>(_entities[0].properties[2]);

  /// See [ContactInfo.lastName].
  static final lastName =
      obx.QueryStringProperty<ContactInfo>(_entities[0].properties[3]);

  /// See [ContactInfo.phoneNumber].
  static final phoneNumber =
      obx.QueryStringProperty<ContactInfo>(_entities[0].properties[4]);

  /// See [ContactInfo.streetAddress1].
  static final streetAddress1 =
      obx.QueryStringProperty<ContactInfo>(_entities[0].properties[5]);

  /// See [ContactInfo.streetAddress2].
  static final streetAddress2 =
      obx.QueryStringProperty<ContactInfo>(_entities[0].properties[6]);

  /// See [ContactInfo.city].
  static final city =
      obx.QueryStringProperty<ContactInfo>(_entities[0].properties[7]);

  /// See [ContactInfo.state].
  static final state =
      obx.QueryStringProperty<ContactInfo>(_entities[0].properties[8]);

  /// See [ContactInfo.zipCode].
  static final zipCode =
      obx.QueryStringProperty<ContactInfo>(_entities[0].properties[9]);
}
