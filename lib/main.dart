import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerpractice/provider/count_provider.dart';
import 'package:providerpractice/provider/favourite_provider.dart';
import 'package:providerpractice/screens/double_provider_example.dart';
import 'package:providerpractice/screens/favourite/favourite.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountProvider(),),
          ChangeNotifierProvider(create: (_) => multipleProviderMain()),
          ChangeNotifierProvider(create: (_) => FavouriteItemProvider())
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: DoubeProviderExample(),
        home: Favourite(),
      ),
    );
  }
}
