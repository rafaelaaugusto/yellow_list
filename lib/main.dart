import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yellow_list/providers/theme_provider.dart';

import 'theme/style_theme.dart';
import 'views/home_view.dart';
import 'views/login_view.dart';
import 'views/onboarding_view.dart';
import 'views/register_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  Widget build(BuildContext context) {
    final defaultTheme = ref.read(themeProvider);

    return FutureBuilder(
      future: downloadGoogleFonts(),
      builder: (context, snapshot) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: defaultTheme.theme,
        routes: {
          '/': (context) => const OnboardingView(),
          '/home': (context) => const HomeView(),
          '/login': (context) => LoginView(),
          '/register': (context) => RegisterView(),
        },
      ),
    );
  }
}
