import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/additemsList.dart';

part 'card_event.dart';
part 'card_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<GetDataButtonPress>((event, emit) {
      emit(CartLoadingState());
      List added_items = addedItems;
      emit(CartLoadedState(added_items));
      // TODO: implement event handler
    });
  }
}
