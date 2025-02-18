import 'package:bloc/bloc.dart';
import 'package:flutter_application_19/controller/home/bloc/home_state.dart';
import 'package:flutter_application_19/repos/Home_product_repo.dart';
import 'package:flutter_application_19/repos/categories_repo.dart';
import 'package:meta/meta.dart';
import 'package:flutter_application_19/model/categories_model.dart';

import '../../../model/home_product_Model.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<CategoryInitialFetchEvent>((event, emit) async {
      try {
        List<Category> categories = await CategoriesRepo.fetchCategories();
        emit(CategoriesFetchSuccessfulState(categories: categories));
        print(categories);
      } catch (e) {
        print(e);
      }
    });
    on<HomeProductsFetchEvent>(
      (event, emit) async {
        try {
          List<Product> products = await BestOfferRepo.getBestOffers();
          print(products);
          emit(HomeProductsFetchSuccessfulState(products: products));
        } catch (e) {}
      },
    );
  }
}
