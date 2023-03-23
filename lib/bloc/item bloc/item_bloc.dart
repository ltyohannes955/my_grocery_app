

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_grocery_app/model/items.dart';

import '../../service/api.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final _apiService = apiservice();
  List cart = [];
  ItemBloc() : super(ItemInitalState()) {
    on<GetItem>((event, emit) async{
      emit(ItemLoadingState());

      try{
        final activity = await _apiService.featchitem();
        emit(ItemLoadedState(item: activity!, cart: cart));

      } catch (e) {
        emit(ItemInitalState());
      }
      
    });
    on<CartEvent>((event, emit) => {cart.add(event.data)
    });

    on<IncrementQunatity>((event, emit) => {cart[event.data].quantity++},);
    on<DecrementQuantity>((event, emit) => {
      if(cart[event.data].quantity > 1){
          cart[event.data].quantity--,
      }
      
    });
  }
}