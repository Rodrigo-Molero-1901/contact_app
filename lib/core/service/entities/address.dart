import 'package:contact_app/core/service/entities/contact_info.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Address {
  @Id()
  int objectId;
  String addressName;

  final contact = ToOne<ContactInfo>();

  Address({
    this.objectId = 0,
    required this.addressName,
  });
}
