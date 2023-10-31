part of 'countr_bloc.dart';

@immutable
sealed class CountrState {}

final class CountrInitial extends CountrState {}
final class CountrLoadingState extends CountrState{}
final class CountrLoadedState extends CountrState{
  final List<ModelClass> countrs;
  CountrLoadedState({required this.countrs});
}
final class CountrErrorState extends CountrState{
  final String errorMessage;
  CountrErrorState({required this.errorMessage});
}
