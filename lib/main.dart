import 'package:connection_notifier/connection_notifier.dart';
import 'package:flutter/material.dart';
import 'package:third/screens/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
import 'theme_config.dart';




void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => ThemeStateProvider(),
        child: const MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    context.read<ThemeStateProvider>().getDarkTheme();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ConnectionNotifier(
      child: Consumer<ThemeStateProvider>(builder: (context, theme, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeConfig.lightTheme,
          darkTheme: ThemeConfig.darkTheme,
          themeMode: theme.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
          home: WelcomeScreen(),
        );
      }),
    );
  }
  
}



