

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_grocery_app/database/service.dart';
import 'package:my_grocery_app/model/items.dart';

import '../../service/api.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final _apiService = apiservice();
  final _Service = Service();
  List cart = [];
  List cartLoad = [];
  ItemBloc() : super(ItemInitalState()) {
    on<GetItem>((event, emit) async{
      emit(ItemLoadingState());

      try{
        final activity = await _apiService.featchitem();
        //  await _Service.readitem().then((val)=>{
        //   cart = val,
        // });
        // cartLoad = Item.cartList(cart);
        emit(ItemLoadedState(item: activity!, cart: cart));

      } catch (e) {
        emit(ItemFailed());
      }
      
    });
    on<CartEvent>((event, emit) => {
      if (!cartLoad.contains(event.data)){
        cartLoad.add(event.data),
        event.data.itemAdded = 1,
        _Service.saveitem(event.data),
      }
    });

    on<IncrementQunatity>((event, emit) => {
      cart[event.data].quantity++,
      _Service.updateitem(
        cartLoad[event.data],
      )
      },);
    on<DecrementQuantity>((event, emit) => {
      if(cart[event.data].quantity > 1){
          cart[event.data].quantity--,
          _Service.updateitem(
                cartLoad[event.data],)
      }

      
    });
    on<ItemRemoveEvent>((event, emit) => {
      cartLoad[event.data].itemAdded = 0,
      cartLoad[event.data].quantity = 1,
      _Service.deleteitem(cartLoad[event.data].id),
      cart.removeAt(event.data),
    });
  }
}