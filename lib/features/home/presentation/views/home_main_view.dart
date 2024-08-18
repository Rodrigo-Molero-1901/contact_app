import 'package:contact_app/features/home/presentation/blocs/home_cubit.dart';
import 'package:contact_app/features/home/presentation/viewmodels/home_view_model.dart';
import 'package:contact_app/features/home/presentation/widgets/contact_row.dart';
import 'package:flutter/material.dart';

class HomeMainView extends StatelessWidget {
  final HomeViewModel viewModel;
  final HomeCubit cubit;

  const HomeMainView({
    super.key,
    required this.viewModel,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Contactos'),
        Expanded(
          child: ListView.builder(
            itemCount: viewModel.contactListViewModels.length,
            itemBuilder: (context, index) {
              final contact = viewModel.contactListViewModels[index];
              return ContactRow(
                onContactTapped: () => cubit.onContactTapped(index),
                onCall: cubit.onCall,
                onMessage: cubit.onMessage,
                contact: contact,
              );
            },
          ),
        )
      ],
    );
  }
}
