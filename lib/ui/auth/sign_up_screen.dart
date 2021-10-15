import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:smash_it/constants/color_constants.dart';
import 'package:smash_it/constants/string_constants.dart';
import 'package:smash_it/controllers/auth_controller.dart';
import 'package:smash_it/helpers/validator.dart';
import 'package:smash_it/ui/widgets/form_input_field_with_icon.dart';

import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final AuthController authController = AuthController.to;
  var isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FantasyColors.PrimaryColor,
      body: Obx(
        () => Form(
          key: _formKey,
          child: ModalProgressHUD(
            inAsyncCall: isLoading.value,
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FormInputFieldWithIcon(
                    iconPrefix: Icons.person,
                    labelText: 'nick name',
                    validator: Validator().name,
                    onChanged: (value) => null,
                    onSaved: (value) {},
                    controller: authController.nameController,
                  ),
                  SizedBox(height: 10),
                  FormInputFieldWithIcon(
                    iconPrefix: Icons.email,
                    labelText: 'email',
                    validator: Validator().email,
                    onChanged: (value) => null,
                    onSaved: (value) {},
                    controller: authController.emailController,
                  ),
                  SizedBox(height: 10),
                  FormInputFieldWithIcon(
                    iconPrefix: Icons.person,
                    labelText: 'password',
                    validator: Validator().password,
                    onChanged: (value) => null,
                    onSaved: (value) {},
                    obscureText: true,
                    maxLines: 1,
                    controller: authController.passwordController,
                  ),
                  TextButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        isLoading.value = true;
                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                        var result = await authController
                            .registerWithEmailAndPassword(context);
                        if (result) {
                          isLoading.value = false;
                          Get.snackbar(Strings.app_name,
                              Strings.success_user_registration,
                              snackPosition: SnackPosition.BOTTOM,
                              duration: Duration(seconds: 3),
                              backgroundColor: Colors.green.shade400,
                              colorText: Colors.white);
                          await Future.delayed(Duration(seconds: 4));
                          Get.to(LoginScreen());
                        } else {
                          isLoading.value = false;
                          Get.snackbar(
                              Strings.app_name, Strings.error_user_registration,
                              snackPosition: SnackPosition.BOTTOM,
                              duration: Duration(seconds: 3),
                              backgroundColor: Colors.blueGrey,
                              colorText: Colors.white);
                        }
                      }
                    },
                    child: const Text('Submit'),
                  ),
                  TextButton(
                    onPressed: () {
                      SystemChannels.textInput.invokeMethod('TextInput.hide');
                      Get.back();
                    },
                    child: const Text('Back to login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
