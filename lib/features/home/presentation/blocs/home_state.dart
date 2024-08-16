part of 'home_cubit.dart';

sealed class HomeState {}

class HomeLoading extends HomeState {}

class HomeMain extends HomeState {
  final HomeViewModel viewModel;

  HomeMain({
    required this.viewModel,
  });
}
