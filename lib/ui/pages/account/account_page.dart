import 'package:flutter/material.dart';
import 'package:projek_bengkel/ui/pages/account/about_page.dart';
import 'package:projek_bengkel/ui/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 200,
                  child: Image.asset("assets/logo.jpg"),
                ),
                SizedBox(
                  width: 200,
                  child: Image.asset("assets/kampus.jpg"),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Icon(
              Icons.person,
              size: 100,
            ),
            const Text("ADMIN"),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AboutPage(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.card_membership),
                    SizedBox(width: 20),
                    Text("Tentang"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.remove("email");
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LoginPage(),
                    ),
                    (route) => false);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.logout),
                    SizedBox(width: 20),
                    Text("Keluar"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
