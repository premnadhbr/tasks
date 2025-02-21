import 'package:bloc/bloc.dart';
import 'package:flutter_application_19/controller/home/bloc/home_state.dart';
import 'package:flutter_application_19/repos/categories_repo.dart';
import 'package:meta/meta.dart';
import 'package:flutter_application_19/model/categories_model.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<CategoryInitialFetchEvent>((event, emit) async {
      try {
        List<Category> categories = await CategoriesRepo.fetchCategories();
        emit(CategoriesFetchSuccessfulState(categories: categories));
        print("categories $categories");
      } catch (e) {
        print(e);
      }
    });
  }
}
