import 'package:contact_app/features/home/data/models/contact_model.dart';
import 'package:contact_app/features/home/presentation/utils/enums.dart';
import 'package:contact_app/features/home/presentation/utils/extensions.dart';
import 'package:contact_app/features/home/presentation/viewmodels/contact_view_model.dart';

part 'home_navigation_view_model.dart';

class HomeViewModel {
  final ContactListStatus contactListStatus;
  final Map<String, List<ContactViewModel>> contactListViewModels;
  final HomeNavigationViewModel? navigation;

  HomeViewModel({
    required this.contactListStatus,
    required List<ContactModel> contactList,
    this.navigation,
  }) : contactListViewModels =
            ContactViewModelExtension.groupContactsByLetter(contactList);
}
