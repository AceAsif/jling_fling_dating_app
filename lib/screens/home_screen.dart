import 'package:flutter/material.dart';
import 'package:jling_fling_dating/blocs_swipe/swipe_event.dart';
import 'package:jling_fling_dating/blocs_swipe/swipe_state.dart';
import 'package:jling_fling_dating/screens/user_screen.dart';
import 'package:jling_fling_dating/widgets/choice_button.dart';
import 'package:jling_fling_dating/widgets/custom_appbar.dart';
import 'package:jling_fling_dating/widgets/user_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jling_fling_dating/blocs_swipe/swipe_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //CustomBar is made to change the default app bar according to my choice
      appBar: CustomAppBar(title: 'DISCOVER'),
      body: BlocBuilder<SwipeBloc, SwipeState>(
          builder: (context, state) {
            if(state is SwipeLoading){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else if (state is SwipeLoaded){
              return Column(children: [
                //Draggable is used for swiping the pictures left or right
                InkWell(
                  onDoubleTap: (){
                    //I had to modified pushnamed because it was not working for me. Push is less complicated than pushnamed.
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  UsersScreen(user: state.users[0]))
                    );
                  },
                  child: Draggable(
                    child: UserCard(user: state.users[0]),
                    feedback: UserCard(user: state.users[0]),
                    //childWhenDragging shows the next person on the list. If this function is not used then the same person is shown.
                    childWhenDragging: UserCard(user: state.users[1]),
                    //Is the user swiping left or right? So 'onDragEnd' is used for knowing which direction the user is swiping.
                    onDragEnd: (drag){
                      if(drag.velocity.pixelsPerSecond.dx < 0) {
                        context.read<SwipeBloc>()
                          ..add(SwipeLeft(user: state.users[0]));
                        print('Swiped Left');
                      } else {
                        context.read<SwipeBloc>()
                          ..add(SwipeRight(user: state.users[0]));
                        print('Swiped Right');
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 60,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          context.read<SwipeBloc>()
                            ..add(SwipeRight(user: state.users[0]));
                          print('Swiped Left');
                        },
                        child: ChoiceButton(
                          width: 60,
                          height: 60,
                          size: 25,
                          hasGradient: false,
                          color: Colors.redAccent,
                          icon: Icons.clear_rounded,
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          context.read<SwipeBloc>()
                            ..add(SwipeRight(user: state.users[0]));
                          print('Swiped Right');
                        },
                        child: ChoiceButton(
                          width: 80,
                          height: 80,
                          size: 30,
                          hasGradient: true,
                          color: Colors.white,
                          icon: Icons.favorite,
                        ),
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
              );
            }
            else {
              return Text('Something went wrong!!');
            }
          }
      ),
    );
  }
}
