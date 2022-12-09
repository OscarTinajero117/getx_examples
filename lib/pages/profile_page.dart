import 'package:example_1/controllers/profile_controller.dart';
import 'package:example_1/widgets/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/route_manager.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      id: 'profile',
      init: ProfileController(),
      initState: (_) {},
      builder: (_) {
        if (_.loading) {
          return const SplashGlobal(mensaje: "Loading...");
        }
        return Scaffold(
          appBar: AppBar(
              leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Get.back(),
          )),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${_.user.firstName} ${_.user.lastName}\n\n${_.user.email}",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  onChanged: _.onInputTextChanged,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                MaterialButton(
                  onPressed: _.go2BackData,
                  color: Colors.blue,
                  child: const Text("Aceptar"),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
