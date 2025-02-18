part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class CategoryInitialFetchEvent extends HomeEvent{}

class HomeProductsFetchEvent extends HomeEvent{}