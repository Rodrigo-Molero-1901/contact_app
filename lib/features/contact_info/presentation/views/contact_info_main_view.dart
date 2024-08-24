import 'package:contact_app/features/contact_info/presentation/blocs/contact_info_cubit.dart';
import 'package:contact_app/features/contact_info/presentation/viewmodels/contact_info_view_model.dart';
import 'package:contact_app/features/contact_info/presentation/widgets/contact_info/info_action_buttons.dart';
import 'package:contact_app/features/contact_info/presentation/widgets/contact_info/info_address_group.dart';
import 'package:contact_app/features/contact_info/presentation/widgets/contact_info/main_info_card.dart';
import 'package:flutter/material.dart';

class ContactInfoMainView extends StatelessWidget {
  final ContactInfoViewModel viewModel;
  final ContactInfoCubit cubit;

  const ContactInfoMainView({
    super.key,
    required this.viewModel,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50.0),
                MainInformationCard(
                  fullName: viewModel.fullName,
                  letterIdentifier: viewModel.letterIdentifier,
                  phoneNumber: viewModel.displayPhoneNumber,
                ),
                const SizedBox(height: 20.0),
                InformationAddressGroup(
                  addressViewModels: viewModel.addressesViewModels,
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
        InformationActionButtons(
          onEditButtonTapped: cubit.onEditButtonTapped,
          onDeleteButtonTapped: () {
            cubit.onDeleteButtonTapped();
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
