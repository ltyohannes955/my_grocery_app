import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../service/api.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final _apiService = apiservice();

  ItemBloc() : super(ItemInitalState()) {
    on<GetDataButtonPressed>((event, emit) async{
      emit(ItemLoadingState());

      try{
        final activity = await _apiService.featchitem();
        emit(ItemLoadedState(item: activity!));

      } catch (e) {
        emit(ItemInitalState());
      }
      
    });
  }
}
