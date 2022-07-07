import 'package:flutter/material.dart';

class DenahPage extends StatelessWidget {
  const DenahPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Center(
              child: Image.asset("assets/logo.jpg"),
            ),
            Center(
              child: Image.asset("assets/denah.png"),
            ),
          ],
        ),
      ),
    );
  }
}
