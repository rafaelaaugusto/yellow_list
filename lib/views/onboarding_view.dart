import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';

import '../components/logo_component.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/images/onboarding.jpg'),
          const Spacer(),
          const Logo(),
          const SizedBox(height: Insets.xxl * 3),
          const Text(
            'Crie listas de forma rápida e prática!',
          ),
          const SizedBox(height: Insets.xxl),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: const Text('Vamos lá!'),
          ),
          const SizedBox(height: Insets.l * 6),
        ],
      ),
    );
  }
}
