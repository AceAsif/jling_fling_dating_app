import 'package:flutter/material.dart';

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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
      body: UserCard(user: User.users[0]),
    );
  }
}

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 20,
        right: 20,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.4,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(user.imageUrls[0]))),
          )
        ],),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
            Expanded(
              child: Image.asset(
                  'assets/images/Jling Fling-logos_black.png',
                height: 70,
              ),
            ),
          Expanded(
              flex: 2,
              child: Text(
                'Discover',
                style: Theme.of(context).textTheme.headline4,
              )
          )
        ],
      ),
      actions: [
        IconButton(icon: const Icon(Icons.message), color: Theme.of(context).primaryColor, onPressed: () {}),
        IconButton(icon: const Icon(Icons.person), color: Theme.of(context).primaryColor, onPressed: () {})
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
