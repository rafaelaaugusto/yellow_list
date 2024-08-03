import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../components/circle_button_component.dart';
import '../components/forms/login_form.dart';
import '../components/logo_component.dart';
import '../viewmodels/auth_viewmodel.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  FormGroup form = FormGroup({
    'email': FormControl<String>(validators: [
      Validators.required,
      Validators.email,
    ]),
    'password': FormControl<String>(
      validators: [Validators.required],
    ),
  });

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authViewModelProvider);
    final authViewModel = ref.read(authViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(Insets.l * 2),
        child: Column(
          children: [
            const Logo(),
            const SizedBox(height: Insets.xxl * 3),
            LoginForm(form: form),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Entrar',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                CircleButton(
                  onPressed: () async {
                    await authViewModel.signIn(
                      form.control('email').value,
                      form.control('password').value,
                    );
                    if (context.mounted) {
                      Navigator.pushNamed(context, '/home');
                    }
                  },
                  isLoading: isLoading,
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('Não tem uma conta? Registre-se.'),
            ),
          ],
        ),
      ),
    );
  }
}
