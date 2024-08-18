import 'package:contact_app/features/home/data/models/contact_model.dart';

class ContactViewModel {
  final String contactId;
  final String firstName;
  final String lastName;

  ContactViewModel({
    required this.contactId,
    required this.firstName,
    required this.lastName,
  });

  factory ContactViewModel.fromModel(ContactModel model) {
    return ContactViewModel(
      contactId: model.contactId ?? '',
      firstName: model.firstName ?? '',
      lastName: model.lastName ?? '',
    );
  }

  String get fullName => '$firstName $lastName';

  String get letterIdentifier => firstName[0];
}
