import 'package:fl_peliculas/providers/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:fl_peliculas/screens/screens.dart';
import 'package:fl_peliculas/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => MoviesProvider(), lazy: false),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Damflix',
      initialRoute: 'home',
      routes: {
        'home': (context) => HomeScreen(),
        'details': (context) => DetailsScreen()
      },
      theme: AppTheme.lightTheme,
    );
  }
}
