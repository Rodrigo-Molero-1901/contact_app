import 'package:contact_app/features/contact_info/presentation/blocs/contact_info_cubit.dart';
import 'package:contact_app/features/contact_info/presentation/views/contact_info_main_view.dart';
import 'package:contact_app/features/contact_info/presentation/views/edit_contact_view.dart';
import 'package:contact_app/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactInfoView extends StatefulWidget {
  final String? contactId;

  const ContactInfoView({
    super.key,
    this.contactId,
  });

  @override
  State<ContactInfoView> createState() => _ContactInfoViewState();
}

class _ContactInfoViewState extends State<ContactInfoView> {
  late ContactInfoCubit _contactInfoCubit;

  @override
  void initState() {
    super.initState();
    _contactInfoCubit = context.read<ContactInfoCubit>();
    _contactInfoCubit.initialize(widget.contactId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactInfoCubit, ContactInfoState>(
      bloc: _contactInfoCubit,
      listener: (context, state) {
        switch (state) {
          case ContactInfoLoading():
          case ContactInfoMain(:final viewModel):
          case ContactInfoEditing():
            break;
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppContextColors.contactInfoBackground,
          body: SafeArea(
            child: switch (state) {
              ContactInfoLoading() => const SizedBox.shrink(),
              ContactInfoMain(:final viewModel) => ContactInfoMainView(
                  viewModel: viewModel,
                  cubit: _contactInfoCubit,
                ),
              ContactInfoEditing(:final viewModel) => EditContactView(
                  viewModel: viewModel,
                  cubit: _contactInfoCubit,
                ),
            },
          ),
        );
      },
    );
  }
}
