import 'package:contact_app/features/contact_info/presentation/blocs/contact_info_cubit.dart';
import 'package:contact_app/features/contact_info/presentation/viewmodels/contact_info_view_model.dart';
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
    return const SingleChildScrollView(
      child: Center(
        child: Text('BOTA TU GAAAAA'),
      ),
    );
  }
}
