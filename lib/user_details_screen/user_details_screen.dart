import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userlistingapp/Api/api.dart';
import 'cubit/user_details_cubit.dart';
part 'components/profile_image_details.dart';
part 'components/tab_controller.dart';
part 'components/tab_view.dart';
part 'components/address_card.dart';
part 'components/personal_details_card.dart';
part 'components/company_address_card.dart';
part 'components/bank_details.dart';
part 'components/personal_info.dart';
part 'components/common_error_details.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key, required this.detailsId});
  final int detailsId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDetailsCubit(),
      child: ProfileScreen(
        detailsId: detailsId,
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final int detailsId;
  const ProfileScreen({super.key, required this.detailsId});
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserDetailsCubit>(context).userDetails(detailsId);
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details', style:TextStyle(
                   fontSize: 20,
                 color: Colors.blue ))
      ),
      body: Container(
        decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Colors.grey[200]!, 
        Colors.black54,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),

    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 10,
        offset: const Offset(0, 3), 
      ),
    ],
  ),
        child: Center(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              double screenWidth = constraints.maxWidth;
              return ProfileInfoTab(
                screenWidth: screenWidth,
                detailsId: detailsId,
              );
            },
          ),
        ),
      ),
    );
  }
}

class ProfileInfoTab extends StatefulWidget {
  final double screenWidth;
  final int detailsId;

  const ProfileInfoTab(
      {super.key, required this.screenWidth, required this.detailsId});

  @override
  State<ProfileInfoTab> createState() => _ProfileInfoTabState();
}

class _ProfileInfoTabState extends State<ProfileInfoTab>
    with TickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();

    _controller = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailsCubit, UserDetailsState>(
      builder: (context, state) {
        if (state is UserDetailsInitial) {
          return const CircularProgressIndicator();
        } else if (state is UserDetailsError) {
          return CommonErrorDetailsScreen(state: state, id: widget.detailsId);
        } else if (state is UserDetailsLoaded) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileImageAndDetails(
                  widget: widget, details: state.userDetailedData),
              UserDefaultTabController(
                  controller: _controller),
              UserTabBarViews(
                  controller: _controller,
                  screenWidth: widget.screenWidth,
                  details: state.userDetailedData),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
