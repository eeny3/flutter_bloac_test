import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progressive_mobile_test/bloc/dish_bloc.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Бургер Кинг'),
        leading: const Icon(Icons.keyboard_backspace),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.info_outline),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 0, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xffE3C742),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Популярные блюда',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  const Text(
                    'Комбо',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  const Text(
                    'Креветки',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  const Text(
                    'Закуски',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  const Text(
                    'Соусы',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                ],
              ),
            ),
          ),
          //DishWidget(),
          BlocConsumer<DishBloc, DishState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is DishesLoaded) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 3.5 / 5,
                        ),
                        children: [
                          DishWidget(
                            imageUrl: state.dishes[0].imageUrl,
                            name: state.dishes[0].name,
                            price: state.dishes[0].price,
                          ),
                          DishWidget(
                            imageUrl: state.dishes[1].imageUrl,
                            name: state.dishes[1].name,
                            price: state.dishes[1].price,
                          ),
                          DishWidget(
                            imageUrl: state.dishes[2].imageUrl,
                            name: state.dishes[2].name,
                            price: state.dishes[2].price,
                          ),
                          DishWidget(
                            imageUrl: state.dishes[3].imageUrl,
                            name: state.dishes[3].name,
                            price: state.dishes[3].price,
                          ),
                          DishWidget(
                            imageUrl: state.dishes[4].imageUrl,
                            name: state.dishes[4].name,
                            price: state.dishes[4].price,
                          ),
                        ]),
                  ),
                );
              } else {
                final dishBloc = BlocProvider.of<DishBloc>(context);
                dishBloc.add(GetDishes());
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class DishWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;

  const DishWidget(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 7,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              image: DecorationImage(
                image: NetworkImage(
                  imageUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.fromLTRB(12, 14, 12, 20),
            decoration: const BoxDecoration(
              color: Color(0xff2E2E2E),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  price,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
