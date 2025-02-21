part of 'items_bloc.dart';

@immutable
sealed class ItemsState {}

final class ItemsInitial extends ItemsState {}

class HomeProductsFetchSuccessfulState extends ItemsState {
  final List<Product> products;
  HomeProductsFetchSuccessfulState({required this.products});
}