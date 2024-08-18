import 'package:contact_app/features/home/presentation/blocs/home_cubit.dart';
import 'package:contact_app/features/home/presentation/viewmodels/home_view_model.dart';
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
    return const SingleChildScrollView(
      child: Center(
        child: Text('BOTA TU GAAAAA'),
      ),
    );
  }
}
