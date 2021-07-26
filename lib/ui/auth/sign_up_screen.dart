import 'package:flutter/material.dart';
import 'package:smash_it/helpers/validator.dart';
import 'package:smash_it/ui/widgets/form_input_field_with_icon.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FormInputFieldWithIcon(
              iconPrefix: Icons.person,
              labelText: 'nick name',
              validator: Validator().name,
              onChanged: (value) => null,
              onSaved: (value) {},
              controller: TextEditingController(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
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
