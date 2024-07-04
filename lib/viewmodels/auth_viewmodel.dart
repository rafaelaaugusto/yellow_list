import '../providers/auth_provider.dart';
import '../services/auth_service.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthViewModel extends StateNotifier<bool> {
  final AuthService authService;

  AuthViewModel(this.authService) : super(false);

  Future<void> signIn(String email, String password) async {
    state = true;
    try {
      await authService.signInWithEmailAndPassword(email, password);
    } finally {
      state = false;
    }
  }

  Future<void> register(String email, String password) async {
    state = true;
    try {
      await authService.registerWithEmailAndPassword(email, password);
    } finally {
      state = false;
    }
  }

  Future<void> signOut() async {
    await authService.signOut();
  }
}

final authViewModelProvider = StateNotifierProvider<AuthViewModel, bool>((ref) {
  final authService = ref.watch(authServiceProvider);
  return AuthViewModel(authService);
});
