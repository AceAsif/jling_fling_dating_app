import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:jling_fling_dating/blocs_swipe/swipe_event.dart';
import 'package:jling_fling_dating/blocs_swipe/swipe_state.dart';

import '../models/user_model.dart';

class SwipeBloc extends Bloc<SwipeEvent, SwipeState>{

  //SwipeBloc() : super(SwipeLoading());
  SwipeBloc()  : super(SwipeLoading()) {
    on<LoadUsers>(_onLoadUsers);
    on<UpdateHome>(_onUpdateHome);
    on<SwipeLeft>(_onSwipeLeft);
    on<SwipeRight>(_onSwipeRight);
  }

  void _onLoadUsers(
      LoadUsers event,
      Emitter<SwipeState> emit,
      ) {
        emit(SwipeLoaded(users: event.users));
  }

  void _onUpdateHome(
      UpdateHome event,
      Emitter<SwipeState> emit,
      ) {
    if (event.users != null) {
      emit(SwipeLoaded(users: event.users!));
    } else {
      emit(SwipeError());
    }
  }

  void _onSwipeLeft(
      SwipeLeft event,
      Emitter<SwipeState> emit,
      ) {
    if (state is SwipeLoaded) {
      final state = this.state as SwipeLoaded;

      List<User> users = List.from(state.users)..remove(event.user);

      if (users.isNotEmpty) {
        emit(SwipeLoaded(users: users));
      } else {
        emit(SwipeError());
      }
    }
  }

  void _onSwipeRight(
      SwipeRight event,
      Emitter<SwipeState> emit,
      ) {
    if (state is SwipeLoaded) {
      final state = this.state as SwipeLoaded;
      List<User> users = List.from(state.users)..remove(event.user);

      if (users.isNotEmpty) {
        emit(SwipeLoaded(users: users));
      } else {
        emit(SwipeError());
      }
    }
  }


  /*
  @override
  Stream<SwipeState> mapEventToState(
      SwipeEvent event,
  ) async* {
    if (event is LoadUserEvent){
      yield* _mapLoadUsersToState(event);
    }
    if (event is SwipeLeftEvent) {
      yield* _mapSwipeLeftToState(event, state);
    }
    if (event is SwipeRightEvent) {
      yield* _mapSwipeRightToState(event, state);
    }
  }

  //These functions are used for removing the people from the list after the user has swiped left or right for the people.
  Stream<SwipeState> _mapLoadUsersToState(
     LoadUserEvent event,
  ) async* {
    yield SwipeLoaded(users: event.users);
  }


  Stream<SwipeState> _mapSwipeLeftToState(
      SwipeLeftEvent event,
      SwipeState state
  ) async*{
    if (state is SwipeLoaded) {
      try {
        yield SwipeLoaded(users: List.from(state.users)..remove(event.user));
      } catch (_) {}
    }
  }

  Stream<SwipeState> _mapSwipeRightToState(
      SwipeRightEvent event,
      SwipeState state
      ) async*{
    if (state is SwipeLoaded) {
      try {
        yield SwipeLoaded(users: List.from(state.users)..remove(event.user));
      } catch (_) {

      }
    }
  }*/

}


