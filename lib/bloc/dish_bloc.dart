import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:progressive_mobile_test/data/dish_repository.dart';

part 'dish_event.dart';
part 'dish_state.dart';

class DishBloc extends Bloc<DishEvent, DishState> {
  final DishRepository _dishRepository;

  DishBloc(this._dishRepository) : super(DishInitial());

  @override
  Stream<DishState> mapEventToState(
    DishEvent event,
  ) async* {
    if (event is GetDishes) {
      final dishes = _dishRepository.fetchDishes();
      yield DishesLoaded(dishes);
    }
  }
}
