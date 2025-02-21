import 'package:bloc/bloc.dart';
import 'package:flutter_application_19/model/home_product_Model.dart';
import 'package:meta/meta.dart';

import '../../../repos/Home_product_repo.dart';
part 'items_event.dart';
part 'items_state.dart';

class ItemsBloc extends Bloc<ItemsEvent, ItemsState> {
  ItemsBloc() : super(ItemsInitial()) {
    on<HomeProductsFetchEvent>(
      (event, emit) async {
        try {
          List<Product> products = await BestOfferRepo.getBestOffers();
          print("products $products");
          emit(HomeProductsFetchSuccessfulState(products: products));
        } catch (e) {}
      },
    );
  }
}
