import '../../../model/categories_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class CategoriesFetchSuccessfulState extends HomeState {
  final List<Category> categories;
  CategoriesFetchSuccessfulState({required this.categories});
}
