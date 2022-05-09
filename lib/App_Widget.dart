import 'package:flutter/material.dart';
import 'home_page.dart';
import 'movie_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Top 20 Movies',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Color.fromARGB(255, 179, 248, 137),
      ),
      debugShowCheckedModeBanner: false,
      //home: const MyHomePage(title: 'Top 20 Movies :)'),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: 'Top 20 Movies'),
      },
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == '/movie') {
          final arg = settings.arguments as String;
          return MaterialPageRoute(builder: (ctx) => MyMoviePage(arg));
        }
        return null;
      },
    );
  }
}
