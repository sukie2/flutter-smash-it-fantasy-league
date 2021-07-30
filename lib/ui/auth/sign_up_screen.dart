import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smash_it/controllers/auth_controller.dart';
import 'package:smash_it/helpers/validator.dart';
import 'package:smash_it/ui/widgets/form_input_field_with_icon.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final AuthController authController = AuthController.to;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: TextButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    SystemChannels.textInput.invokeMethod('TextInput.hide');
                    authController.registerWithEmailAndPassword(context);
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
