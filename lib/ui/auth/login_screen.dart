import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:smash_it/constants/string_constants.dart';
import 'package:smash_it/controllers/auth_controller.dart';
import 'package:smash_it/helpers/validator.dart';
import 'package:smash_it/ui/auth/sign_up_screen.dart';
import 'package:smash_it/ui/game/home_screen.dart';
import 'package:smash_it/ui/widgets/form_input_field_with_icon.dart';

import 'forgot_password.dart';

class LoginScreen extends StatelessWidget {
  final AuthController authController = AuthController.to;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ModalProgressHUD(
          inAsyncCall: isLoading.value,
          child: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.to(() => ForgotPasswordScreen());
                        },
                        child: Text('Forgot Password'),
                      ),
                      SizedBox(height: 10),
                      TextButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            isLoading.value = true;
                            SystemChannels.textInput
                                .invokeMethod('TextInput.hide');
                            var result = await authController
                                .signInWithEmailAndPassword(context);
                            if (result) {
                              isLoading.value = false;
                              Get.to(HomeScreen());
                            } else {
                              isLoading.value = false;
                              Get.snackbar(StringConstants.app_name,
                                  StringConstants.error_login_fail,
                                  snackPosition: SnackPosition.BOTTOM,
                                  duration: Duration(seconds: 3),
                                  backgroundColor:
                                  Get.theme.snackBarTheme.backgroundColor,
                                  colorText:
                                  Get.theme.snackBarTheme.actionTextColor);
                            }
                          }
                        },
                        child: const Text('Login',style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('No account with us?'),
                      TextButton(
                        onPressed: () async {
                          Get.to(SignUpScreen());
                        },
                        child: const Text('Sign Up'),
                      ),
                    ],
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
