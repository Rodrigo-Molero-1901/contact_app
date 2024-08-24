import 'package:contact_app/features/contact_info/presentation/blocs/contact_info_cubit.dart';
import 'package:contact_app/features/contact_info/presentation/viewmodels/contact_info_view_model.dart';
import 'package:contact_app/features/contact_info/presentation/widgets/info_action_buttons.dart';
import 'package:contact_app/shared/constants/app_colors.dart';
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
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          const SizedBox(height: 50.0),
          SizedBox(
            height: 250.0,
            child: Stack(
              children: [
                Positioned.fill(
                  top: 50.0,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    padding: const EdgeInsets.only(top: 65.0),
                    decoration: BoxDecoration(
                      color: AppContextColors.contactCardBackground,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      children: [
                        Text(viewModel.fullName),
                        if (viewModel.displayPhoneNumber.isNotEmpty) ...[
                          const SizedBox(height: 5.0),
                          Text(viewModel.displayPhoneNumber),
                        ],
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundColor: AppContextColors.contactAvatar,
                    child: Text(
                      viewModel.letterIdentifier,
                      style: const TextStyle(
                        fontSize: 34,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          InformationActionButtons(
            onEditButtonTapped: cubit.onEditButtonTapped,
            onDeleteButtonTapped: () {
              cubit.onDeleteButtonTapped();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
