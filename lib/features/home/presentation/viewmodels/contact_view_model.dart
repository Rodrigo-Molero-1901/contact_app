import 'package:contact_app/features/home/data/models/contact_model.dart';

class ContactViewModel {
  final int objectId;
  final String contactId;
  final String firstName;
  final String lastName;

  ContactViewModel({
    required this.objectId,
    required this.contactId,
    required this.firstName,
    required this.lastName,
  });

  factory ContactViewModel.fromModel(ContactModel model) {
    return ContactViewModel(
      objectId: model.objectId ?? 0,
      contactId: model.contactId ?? '',
      firstName: model.firstName ?? '',
      lastName: model.lastName ?? '',
    );
  }

  String get fullName => '$firstName $lastName';

  String get letterIdentifier => firstName[0];
}
