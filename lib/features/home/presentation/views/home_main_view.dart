import 'package:contact_app/features/home/presentation/blocs/home_cubit.dart';
import 'package:contact_app/features/home/presentation/viewmodels/home_view_model.dart';
import 'package:contact_app/features/home/presentation/widgets/contact_group.dart';
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
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Contacts',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: cubit.onCreateContactTapped,
                icon: const Icon(Icons.add_outlined),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        Expanded(
          child: ContactGroup(
            contactListViewModel: viewModel.contactListViewModels,
            cubit: cubit,
          ),
        ),
      ],
    );
  }
}
