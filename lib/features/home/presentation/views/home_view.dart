import 'package:contact_app/core/router/router.dart';
import 'package:contact_app/di/injection.dart';
import 'package:contact_app/features/home/presentation/blocs/home_cubit.dart';
import 'package:contact_app/features/home/presentation/viewmodels/home_view_model.dart';
import 'package:contact_app/features/home/presentation/views/home_main_view.dart';
import 'package:contact_app/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeCubit _homeCubit;

  @override
  void initState() {
    super.initState();
    _homeCubit = injector<HomeCubit>();
    _homeCubit.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      bloc: _homeCubit,
      listener: (context, state) async {
        if (state case HomeMain(:final viewModel)) {
          if (viewModel.navigation != null) {
            bool actionWasPerformed = false;
            switch (viewModel.navigation!) {
              case HomeAddContactNavigation():
                final result = await context.push(Routes.pathAddContact);
                actionWasPerformed = result == true;
              case HomeContactInfoNavigation(:final contactId):
                final result = await context.push(
                  Routes.pathContactInfo,
                  extra: contactId,
                );
                actionWasPerformed = result == true;
            }
            if (actionWasPerformed) {
              Future.delayed(
                const Duration(milliseconds: 250),
                () => _homeCubit.initialize(),
              );
            }
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppContextColors.homeBackground,
          body: SafeArea(
            child: switch (state) {
              HomeLoading() => const SizedBox.shrink(),
              HomeMain(:final viewModel) => HomeMainView(
                  viewModel: viewModel,
                  cubit: _homeCubit,
                ),
            },
          ),
        );
      },
    );
  }
}
