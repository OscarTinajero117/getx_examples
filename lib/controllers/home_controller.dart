// ignore_for_file: avoid_print

import 'package:example_1/api/users_api.dart';
import 'package:example_1/models/user.dart';
import 'package:example_1/pages/profile_page.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController {
  int _counter = 0;
  List<User> _users = [];
  bool _loading = true;

  int get counter => _counter;
  List<User> get users => _users;
  bool get loading => _loading;

  @override
  void onInit() {
    super.onInit();
    print("InitSate");
  }

  @override
  void onReady() {
    super.onReady();
    print("OnReady");
    loadUsers();
  }

  Future<void> loadUsers() async {
    final data = await UserAPI.instance.getUsers(1);
    if (data == null) {
      _users = [];
    } else {
      _users = data;
    }

    _loading = false;

    update(['users']);
  }

  void increment() {
    _counter++;
    update(['text']);
  }

  Future<void> showUserProfile(User user) async {
    final result = await Get.to<String>(
      () => const ProfilePage(),
      arguments: user,
    );
    if (result != null) {
      print("Have result -> $result");
    }
  }
}
