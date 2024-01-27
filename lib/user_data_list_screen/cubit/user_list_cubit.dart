// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:userlistingapp/Api/api.dart';
part 'user_list_state.dart';

class UserListCubit extends Cubit<UserListState> {
  UserListCubit() : super(UserListInitial()) {
    initialFetch();
  }
  int page = 0;
  static const limit = 10;
  bool isMax = false;

  List<UserList>? userList = [];
  void initialFetch() async {
    page = 0;
    isMax = false;
    userList = await UsersAPI.getUserLists(page, limit);
    if (userList == null || (userList != null && userList!.isEmpty)) {
      emit(UserListError());
    }
    emit(UserListData(userList: userList));
  }

  void nextPage() async {
    page++;
    List<UserList>? tempList = [];
    emit(UserListNextPage(userList: userList));
    tempList = await UsersAPI.getUserLists(page, limit);
    if (tempList == null) {
      emit(UserListData(userList: userList));
    }
    if (tempList != null && tempList.isEmpty) {
      isMax = true;
      emit(UserListData(userList: userList));
    } else if (tempList != null && tempList.isNotEmpty) {
      userList!.addAll(tempList);
      emit(UserListData(userList: userList));
    }
  }
}
