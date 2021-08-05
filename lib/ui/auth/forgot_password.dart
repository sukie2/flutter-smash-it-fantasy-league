import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smash_it/controllers/auth_controller.dart';
import 'package:smash_it/helpers/validator.dart';
import 'package:smash_it/ui/auth/login_screen.dart';
import 'package:smash_it/ui/widgets/form_input_field_with_icon.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final AuthController authController = AuthController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Enter your email address'),
            SizedBox(height: 10),
            FormInputFieldWithIcon(
              iconPrefix: Icons.email,
              labelText: 'email',
              validator: Validator().email,
              onChanged: (value) => null,
              onSaved: (value) {},
              maxLines: 1,
              controller: authController.emailController,
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () async {
                await authController.resetPassword(context);
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Password reset email sent'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => {
                          Get.back(),
                          Get.to(() => LoginScreen())
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text(
                'Reset',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
