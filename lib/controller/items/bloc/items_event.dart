part of 'items_bloc.dart';

@immutable
sealed class ItemsEvent {}

class HomeProductsFetchEvent extends ItemsEvent{}