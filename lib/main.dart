import 'package:flutter/material.dart';
import 'package:jling_fling_dating/widgets/custom_appbar.dart';
import 'package:jling_fling_dating/widgets/user_card.dart';


import 'models/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of our dating application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //CustomBar is made to change the default app bar according to my choice
      appBar: CustomAppBar(),
      body: Column(
        children: [
          UserCard(user: User.users[0]),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 60,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ChoiceButton(
                  width: 60,
                  height: 60,
                  size: 25,
                  hasGradient: false,
                  color: Colors.redAccent,
                  icon: Icons.clear_rounded,
                ),
                ChoiceButton(
                  width: 80,
                  height: 80,
                  size: 30,
                  hasGradient: true,
                  color: Colors.white,
                  icon: Icons.favorite,
                ),
                ChoiceButton(
                  width: 60,
                  height: 60,
                  size: 25,
                  hasGradient: false,
                  color: Colors.black,
                  icon: Icons.watch_later,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChoiceButton extends StatelessWidget {
  final double width;
  final double height;
  final double size;
  final Color color;
  final bool hasGradient;
  final IconData icon;

  const ChoiceButton({Key? key,
    required this.width,
    required this.height,
    required this.size,
    required this.color,
    required this.hasGradient,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        gradient: hasGradient
            ? LinearGradient(colors: [
                //Colors.black,
                Colors.blueAccent,
                Colors.redAccent
              ],
            )
          : LinearGradient(colors: [
              Colors.white,
              Colors.white,
              ],
            ),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withAlpha(50),
              spreadRadius: 4,
              blurRadius: 4,
              offset: Offset(3,3),
          ),
        ]
      ),
      child: Icon(
          icon,
          color: color,
        size: size,
      ),
    );
  }
}

