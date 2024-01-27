part of 'user_list_cubit.dart';

@immutable
sealed class UserListState {}

final class UserListInitial extends UserListState {}

// ignore: must_be_immutable
final class UserListError extends UserListState {
  String? message;
  UserListError({this.message});
}

// ignore: must_be_immutable
final class UserListData extends UserListState {
  List<UserList>? userList;
  UserListData({this.userList});
}

// ignore: must_be_immutable
final class UserListNextPage extends UserListState {
  List<UserList>? userList;
  UserListNextPage({this.userList});
}
