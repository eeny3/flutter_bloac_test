import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progressive_mobile_test/bloc/dish_bloc.dart';
import 'package:progressive_mobile_test/widgets/dish_widget.dart';

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
                    child: GridView.builder(
                      itemCount: state.dishes.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 3.5 / 5,
                      ),
                      itemBuilder: (context, index) {
                        return DishWidget(
                          imageUrl: state.dishes[index].imageUrl,
                          name: state.dishes[index].name,
                          price: state.dishes[index].price,
                        );
                      },
                    ),
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
