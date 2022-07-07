import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projek_bengkel/core/providers/db_mekanik_provider.dart';
import 'package:projek_bengkel/ui/pages/dashboard_page.dart';
import 'package:projek_bengkel/ui/widgets/list_mekanik_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    this.progressColor = false,
    this.platNomor,
  }) : super(key: key);

  final bool? progressColor;
  final String? platNomor;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;

  final TextEditingController m1C = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const DashboardPage(),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.person,
                          size: 100,
                        ),
                      ),
                      const Text("ADMIN"),
                    ],
                  ),
                  Center(
                    child: Image.asset(
                      "assets/logo.jpg",
                      // width: 300,
                      width: 200,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // New Code
              ListMekanik(),
            ],
          ),
        ),
      ),
    );
  }
}
