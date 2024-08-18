import 'package:contact_app/di/injection.dart';
import 'package:contact_app/features/contact_info/presentation/blocs/contact_info_cubit.dart';
import 'package:contact_app/features/contact_info/presentation/views/contact_info_main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactInfoView extends StatefulWidget {
  const ContactInfoView({super.key});

  @override
  State<ContactInfoView> createState() => _ContactInfoViewState();
}

class _ContactInfoViewState extends State<ContactInfoView> {
  late ContactInfoCubit _contactInfoCubit;

  @override
  void initState() {
    super.initState();
    _contactInfoCubit = injector<ContactInfoCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactInfoCubit, ContactInfoState>(
      bloc: _contactInfoCubit,
      listener: (context, state) {
        switch (state) {
          case ContactInfoLoading():
          case ContactInfoMain(:final viewModel):
            break;
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: switch (state) {
            ContactInfoLoading() => const SizedBox.shrink(),
            ContactInfoMain(:final viewModel) => ContactInfoMainView(
                viewModel: viewModel,
                cubit: _contactInfoCubit,
              ),
          },
        );
      },
    );
  }
}
