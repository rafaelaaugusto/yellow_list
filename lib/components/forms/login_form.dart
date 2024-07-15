import 'package:flutter/widgets.dart';
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
          ReactiveTextField(),
          ReactiveTextField(),
        ],
      ),
    );
  }
}
