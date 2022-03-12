part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
  UserState get initialState=>UserIsNotSearched();
}
class UserIsNotSearched extends UserState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}
class UserIsLoading extends UserState{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}
class UserIsLoaded extends UserState{
  final _user;
  UserIsLoaded(this._user);
  Welcome get getUser=>_user;
  @override
  // TODO: implement props
  List<Object> get props => [_user];

}
class UserIsNotLoaded extends UserState{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}
