part of 'dish_bloc.dart';

@immutable
abstract class DishState {}

class DishesLoaded extends DishState {
  final List dishes;
  DishesLoaded(this.dishes);
}

class DishInitial extends DishState {}
