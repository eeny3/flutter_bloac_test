import 'model/dish_model.dart';

abstract class DishRepository {
  List fetchDishes();
}

class FakeDishRepository implements DishRepository {
  @override
  List<Dish> fetchDishes() {
    List<Dish> dishes = [
      Dish(
        imageUrl:
            'https://www.hvadimad.dk/wp-content/uploads/2020/09/Burger-King-Crispy-Chicken.png',
        name: 'Чикен Бургер',
        price: '45 ₽',
      ),
      Dish(
        imageUrl:
            'https://cdn.popbela.com/content-images/post/20190811/ac519ad54d5bbc985109fa201569bba3.jpg',
        name: 'Чизбургер',
        price: '50 ₽',
      ),
      Dish(
          imageUrl:
              'https://burger4me.ru/wp-content/uploads/2021/04/vopper-king-kombo-m-menu-burgerking.png',
          name: 'Воппер Комбо',
          price: '380 ₽'),
      Dish(
          imageUrl: 'https://riviera-ashe.ru/images/canteen/krasniy-sous.jpg',
          name: 'Кетчуп',
          price: '8 ₽'),
      Dish(
        imageUrl:
            'https://burgerking.com.mt/wp-content/uploads/2020/03/Hot-Brownie-with-Ice-Cream.png',
        name: 'Брауни с мороженым',
        price: '152 ₽',
      ),
    ];
    return dishes;
  }
}
