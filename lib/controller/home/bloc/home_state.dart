import '../../../model/categories_model.dart';
import '../../../model/home_product_Model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class CategoriesLoadingState extends HomeState {}

class CategoriesFetchSuccessfulState extends HomeState {
  final List<Category> categories;
  CategoriesFetchSuccessfulState({required this.categories});
}


class HomeProductsFetchSuccessfulState extends HomeState {
  final List<Product> products;
  HomeProductsFetchSuccessfulState({required this.products});
}