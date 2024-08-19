import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.form,
  });

  final FormGroup form;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: widget.form,
      child: Column(
        children: [
          ReactiveTextField(
            formControlName: 'email',
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
            validationMessages: {
              ValidationMessage.required: (error) => 'Informe o email',
              ValidationMessage.email: (error) => 'Informe um email válido'
            },
          ),
          const SizedBox(height: Insets.xxl),
          ReactiveTextField(
            formControlName: 'password',
            decoration: InputDecoration(
              labelText: 'Senha',
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: _toggleVisibility,
              ),
            ),
            obscureText: _obscureText,
            validationMessages: {
              ValidationMessage.required: (error) => 'Informe a senha',
            },
          ),
        ],
      ),
    );
  }
}
