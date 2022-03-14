import 'package:flutter/material.dart';
import 'package:movie_app/helper/theme.dart';
import 'package:movie_app/view/home_page.dart';
import 'package:movie_app/view_model/movie_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MovieProvider>(
        create: (_) => MovieProvider(),
        child: MaterialApp(
          title: 'Flutter Demo',
          darkTheme: AppTheme.darkTheme,
          theme: AppTheme.lightTheme,
          // theme: ThemeData(
          //   // scaffoldBackgroundColor: Colors.black12,
          //   // brightness: Brightness.dark,//
          //   primaryColor: Colors.lightBlue[800],
          //   textTheme: const TextTheme(
          //     headline1: TextStyle(
          //         fontSize: 32.0,
          //         fontWeight: FontWeight.bold,
          //         color: Color.fromRGBO(81, 124, 164, 1)),
          //     headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          //     bodyText2: TextStyle(fontSize: 14.0),
          //   ).apply(displayColor: Colors.amber[300]),
          // ),
          home: HomePage(),
        ));
  }
}
