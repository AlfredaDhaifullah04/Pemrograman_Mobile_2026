import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mydj/data/data_provider.dart';
import 'package:mydj/pages/simple_home_page.dart';
import 'package:mydj/pages/login_page.dart';

class StartupPage extends StatefulWidget {
  const StartupPage({super.key});

  @override
  State<StartupPage> createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  bool? _isLoggedIn;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    bool status = false;
    try {
      final provider = context.read<DataProvider>();
      status = await provider.isLoggedIn().timeout(
        const Duration(seconds: 5),
        onTimeout: () => false,
      );
    } catch (e, stack) {
      debugPrint('Error cek status login: $e\n$stack');
      status = false;
    }

    if (!mounted) return;
    setState(() {
      _isLoggedIn = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoggedIn == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return _isLoggedIn!
        ? const SimpleHomePage(title: 'Beranda')
        : const LoginPage();
  }
}