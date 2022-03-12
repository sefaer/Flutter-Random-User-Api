part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}
class FetchUser extends UserEvent{
  final _elemanSayisi;
  FetchUser(this._elemanSayisi);

  @override
  List<Object> get props => [_elemanSayisi];
}
class ResetUser extends UserEvent{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}
