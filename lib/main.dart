import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progressive_mobile_test/bloc/dish_bloc.dart';
import 'package:progressive_mobile_test/data/dish_repository.dart';
import 'screen/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          color: Colors.black,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          centerTitle: true,
        ),
      ),
      home: BlocProvider(
        create: (context) => DishBloc(FakeDishRepository()),
        child: const Menu(),
      ),
    );
  }
}
