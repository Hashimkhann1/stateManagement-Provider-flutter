import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerpractice/provider/Theme.dart';

class DarkWhiteTheme extends StatefulWidget {
  const DarkWhiteTheme({Key? key}) : super(key: key);

  @override
  State<DarkWhiteTheme> createState() => _DarkWhiteThemeState();
}

class _DarkWhiteThemeState extends State<DarkWhiteTheme> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ChangeThemes>(context);
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Theme'),
          ),
          body: Column(
            children: <Widget>[
              RadioListTile<ThemeMode>(
                  title: Text('Light Theme'),
                  value: ThemeMode.light,
                  groupValue: themeChange.currentThemeMode,
                  onChanged: themeChange.setTheme),
              RadioListTile<ThemeMode>(
                  title: Text('Dark Theme'),
                  value: ThemeMode.dark,
                  groupValue: themeChange.currentThemeMode,
                  onChanged: themeChange.setTheme),
              RadioListTile<ThemeMode>(
                  title: Text('System Theme'),
                  value: ThemeMode.system,
                  groupValue: themeChange.currentThemeMode,
                  onChanged: themeChange.setTheme),
            ],
          ),
        )
    );
  }
}
