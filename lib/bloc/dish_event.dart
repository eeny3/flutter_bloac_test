part of 'dish_bloc.dart';

@immutable
abstract class DishEvent {}

class GetDishes extends DishEvent {
  GetDishes();
}
