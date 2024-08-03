import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.form,
  });

  final FormGroup form;

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
      child: Column(
        children: [
          ReactiveTextField(
            formControlName: 'email',
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          const SizedBox(height: Insets.xxl),
          ReactiveTextField(
            formControlName: 'password',
            decoration: const InputDecoration(labelText: 'Senha'),
          ),
        ],
      ),
    );
  }
}
