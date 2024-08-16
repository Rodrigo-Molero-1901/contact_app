part of 'contact_info_cubit.dart';

sealed class ContactInfoState {}

class ContactInfoLoading extends ContactInfoState {}

class ContactInfoMain extends ContactInfoState {
  final ContactInfoViewModel viewModel;

  ContactInfoMain({
    required this.viewModel,
  });
}
