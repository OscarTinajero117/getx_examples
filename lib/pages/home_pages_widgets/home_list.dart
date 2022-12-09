import 'package:example_1/controllers/home_controller.dart';
import 'package:example_1/models/user.dart';
import 'package:example_1/widgets/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeList extends StatelessWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'users',
      builder: (_) {
        if (_.loading) {
          return const SplashGlobal(mensaje: "Welcome!");
        }
        return ListView.builder(
          itemBuilder: (context, index) {
            final User user = _.users[index];
            return ListTile(
              title: Text(user.firstName),
              subtitle: Text(user.email),
              onTap: () => _.showUserProfile(user),
            );
          },
          itemCount: _.users.length,
        );
      },
    );
  }
}
