import 'package:objectbox/objectbox.dart';

@Entity()
class Contact {
  @Id()
  int objectId;
  String contactId;
  String firstName;
  String lastName;

  Contact({
    this.objectId = 0,
    required this.contactId,
    required this.firstName,
    required this.lastName,
  });
}
