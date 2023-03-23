part of 'item_bloc.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();

  @override
  List<Object> get props => [];
}

class GetItem extends ItemEvent{
  const GetItem();
  
  @override
  List<Object> get props => [];
}

class CartEvent extends ItemEvent {
  final Item item;
   const CartEvent({required this.item});

  @override
  List<Object> get props => [];

  get data => item;
}

class IncrementQunatity extends ItemEvent{
  final int index;
  IncrementQunatity(this.index);

  @override
  List<Object> get props => [];

  get data => index;
}

class DecrementQuantity extends ItemEvent{
  final int index;
  DecrementQuantity(this.index);

  @override
  List<Object> get props => [];

  get data => index;
}