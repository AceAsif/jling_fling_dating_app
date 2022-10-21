import 'package:flutter/material.dart';
import 'package:jling_fling_dating/blocs_swipe/swipe_event.dart';
import 'package:jling_fling_dating/config/app_router.dart';
import 'package:jling_fling_dating/config/theme.dart';
import 'package:jling_fling_dating/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jling_fling_dating/blocs_swipe/swipe_bloc.dart';

import 'models/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of our dating application.
  @override
  Widget build(BuildContext context) {
    return
    MultiBlocProvider(providers: [
       BlocProvider(create: (_) => SwipeBloc()
          ..add(LoadUsers(users: User.users))
       )
    ],
        child: MaterialApp(
            title: 'Dating App',
            theme: theme(),
           /* theme: ThemeData(
              primarySwatch: Colors.teal,
            ),*/
            debugShowCheckedModeBanner: false,
            //home: const MyHomePage(title: 'Dating App Home Page'),
            //onGenerateInitialRoutes: AppRouter.onGenerateRoute,
            //initialRoute: HomeScreen.routeName,
            //home: UsersScreen(user: User.users[0]),
            home: HomeScreen(),
        )
    );
  }
}
