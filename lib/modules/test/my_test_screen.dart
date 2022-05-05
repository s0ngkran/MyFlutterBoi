import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/shared.dart';
import '../auth/auth_controller.dart';

class MyTestScreen extends StatelessWidget {
  final AuthController controller = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GradientBackground(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: Common.appBar(
            context,
            'Page Title',
            Icons.arrow_back,
            Colors.white,
          ),
          body: const Text('welcome to test page'),
        ),
      ],
    );
  }

  Widget _buildForms(BuildContext context) {
    return Form(
      key: controller.loginFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InputField(
              controller: controller.loginEmailController,
              keyboardType: TextInputType.text,
              labelText: 'Email address',
              placeholder: 'Enter Email Address',
              validator: (value) {
                if (!Regex.isEmail(value!)) {
                  return 'Email format error.';
                }

                if (value.isEmpty) {
                  return 'Email is required.';
                }
                return null;
              },
            ),
            Common.rowHeight(),
            InputField(
              controller: controller.loginPasswordController,
              keyboardType: TextInputType.emailAddress,
              labelText: 'Password',
              placeholder: 'Enter Password',
              password: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Password is required.';
                }

                if (value.length < 6 || value.length > 15) {
                  return 'Password should be 6~15 characters';
                }

                return null;
              },
            ),
            Common.rowHeight(height: 80),
            BorderButton(
              text: 'Sign In',
              backgroundColor: Colors.white,
              onPressed: () {
                controller.login(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
