part of '../api.dart';

Future<UserList?> _getUserDetails(int id) async {
  try {
   final Response response = await   Dio().get(
        'https://dummyjson.com/users/$id' ,
      );
    if (response.statusCode == 200 && response.data != null) {
      UserList a = UserList.fromJson(response.data);
      return a;
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}
