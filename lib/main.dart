import 'package:flutter/material.dart';
import 'package:projek_bengkel/core/models/mekanik_model.dart';
import 'package:projek_bengkel/core/models/stall_model.dart';
import 'package:projek_bengkel/core/providers/db_mekanik_provider.dart';
import 'package:projek_bengkel/core/providers/db_stall_provider.dart';
import 'package:projek_bengkel/core/providers/mekanik_provider.dart';
import 'package:projek_bengkel/ui/pages/login_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/providers/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MekanikProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
