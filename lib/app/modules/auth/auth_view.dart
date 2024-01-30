import 'package:flutter/material.dart';
import 'package:flutter_core/constants/dimens.dart';
import 'package:flutter_core/getx.dart';

import '../../components/buttons/login_button.dart';
import '../../components/common.dart';
import '../../components/input_field/custom_input_field.dart';
import 'auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});
  static String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TopScreenImage(screenImageName: 'home.png'),
              SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 15.0, left: 15, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Obx(() => Text(
                          controller.loggedInUser.value.password ?? 'IVS')),
                      const Text(
                        'Sign In',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Dimens.vml,
                      CustomInputField(
                        isPassword: false,
                        prefixIcon: const Icon(Icons.person),
                        label: 'Username',
                        controller: controller.loginController['username'],
                        onChange: (value) {
                          controller.loggedInUser.value.userid = value;
                        },
                      ),
                      Dimens.vml,
                      CustomInputField(
                        isPassword: true,
                        prefixIcon: const Icon(Icons.key),
                        label: 'Password',
                        controller: controller.loginController['password'],
                        onChange: (value) {
                          controller.loggedInUser.value.password = value;
                        },
                      ),
                      Dimens.vmxl,
                      LoginButton(
                        onPressed: controller.userLogin,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
