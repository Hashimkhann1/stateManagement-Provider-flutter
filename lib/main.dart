import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerpractice/provider/Theme.dart';
import 'package:providerpractice/provider/count_provider.dart';
import 'package:providerpractice/provider/favourite_provider.dart';
import 'package:providerpractice/provider/user_api_data_provider.dart';
import 'package:providerpractice/provider/user_modal_provider.dart';
import 'package:providerpractice/screens/dark_white_theme/dark_and_white_theme.dart';
import 'package:providerpractice/screens/data_modal_api_data.dart';
import 'package:providerpractice/screens/data_modal_api_with_Provider.dart';
import 'package:providerpractice/screens/double_provider_example.dart';
import 'package:providerpractice/screens/favourite/favourite.dart';
import 'package:providerpractice/screens/textFieldPrctice.dart';
import 'package:providerpractice/screens/user_provider/user_api_data_modal.dart';


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
          ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
          ChangeNotifierProvider(create: (_) => ChangeThemes()),
          ChangeNotifierProvider(create: (_) => UserModalProvier()),
          ChangeNotifierProvider(create: (_) => UserApiDataProvider()),

        ],
      child: Builder(builder: (BuildContext context){
        final themeChanger = Provider.of<ChangeThemes>(context).currentThemeMode;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter App',
          themeMode: themeChanger,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark
          ),
          // home: DoubeProviderExample(),
          // home: Favourite(),
          // home: TextFieldPrctice(),
          // home: DataModalApi(),
          // home: DataModalApiWithProvider(),
          home: UserApiDataModal(),
        );
      },)
    );
  }
}

