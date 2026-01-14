import 'package:flutter/material.dart';
import 'package:flumo_flutter_example/core/routing/app_routes.dart';

/// Simple splash screen that navigates to the home page after a delay.
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Simulate loading work, then navigate to home.
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.bolt, size: 64),
            SizedBox(height: 16),
            Text('Splash Screen'),
          ],
        ),
      ),
    );
  }
}
