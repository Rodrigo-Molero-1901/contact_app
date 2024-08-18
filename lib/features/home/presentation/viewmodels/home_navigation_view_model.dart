part of 'home_view_model.dart';

sealed class HomeNavigationViewModel {}

class HomeContactInfoNavigation extends HomeNavigationViewModel {
  final String contactId;

  HomeContactInfoNavigation({
    required this.contactId,
  });
}
