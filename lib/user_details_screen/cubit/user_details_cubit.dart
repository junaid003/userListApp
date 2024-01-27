// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart';
import 'package:userlistingapp/Api/api.dart';
part 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  UserDetailsCubit() : super(UserDetailsInitial());
  void userDetails(int id) async {
    UserList? userDetails = await UsersAPI.getUserDetails(id);
    if (userDetails == null) {
      UserDetailsError(message: "Something went wrong, please try again");
    }
    emit(UserDetailsLoaded(userDetails));
  }

  void openEmail(String mail) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: mail,
    );
    String url = params.toString();
    if (await canLaunchUrl(params)) {
      await launchUrl(params);
    } else {
      debugPrint('Could not launch $url');
    }
  }

  Future<void> makeCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

 
}
