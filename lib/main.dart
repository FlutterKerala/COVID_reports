import 'package:coronareport/provider/data_fetch.dart';
import 'package:coronareport/screens/home_screen.dart';
import 'package:coronareport/screens/previos_all_india_data_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: DataFetch(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          PreviousAllIndiaDatas.routeName: (ctx) => PreviousAllIndiaDatas(),
        },
        home: HomeScreen(),
      ),
    );
  }
}
