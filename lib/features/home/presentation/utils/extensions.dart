import 'package:contact_app/features/home/data/models/contact_model.dart';
import 'package:contact_app/features/home/presentation/viewmodels/contact_view_model.dart';

extension ContactViewModelExtension on ContactViewModel {
  static Map<String, List<ContactViewModel>> groupContactsByLetter(
      List<ContactModel> contactList) {
    final Map<String, List<ContactViewModel>> groupedContacts = {};
    for (var contact in contactList) {
      final viewModel = ContactViewModel.fromModel(contact);
      final initialLetter = viewModel.firstName[0].toUpperCase();
      if (groupedContacts.containsKey(initialLetter)) {
        groupedContacts[initialLetter]!.add(viewModel);
      } else {
        groupedContacts[initialLetter] = [viewModel];
      }
    }
    return groupedContacts;
  }
}
