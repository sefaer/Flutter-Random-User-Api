import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_random_user_api/userModel.dart';
import 'package:flutter_random_user_api/userRepo.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepo userRepo;
  UserBloc(this.userRepo) : super(UserInitial());
  UserState get initialState=>UserIsNotSearched();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is FetchUser) {
      yield UserIsLoading();
      try {
        Welcome user = await userRepo.getUser(event._elemanSayisi);
        yield UserIsLoaded(user);
      } catch (_){
        yield UserIsNotLoaded();
      }
    } else if (event is ResetUser) {
      yield UserIsNotSearched();
    }
  }
}
