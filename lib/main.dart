import 'package:bloc_wall_street_news/screens/NewsScreen.dart';
import 'package:bloc_wall_street_news/screens/counterScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const OptionScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/counterScreen': (context) =>
            const CounterScreen(title: 'BLoC state management'),
        '/newsScreen': (context) => const NewsScreen(),
      },
      // home: const CounterScreen(title: 'BLoC state management'),
      // home: const OptionScreen(),
      // home: const NewsScreen(),
    );
  }
}

class OptionScreen extends StatelessWidget {
  const OptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Screen'),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/newsScreen');
              },
              child: Text(
                'News',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/counterScreen');
              },
              child: Text(
                'Counter Screen',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
