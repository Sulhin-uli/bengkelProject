import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          color: Colors.red,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          height: 150,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Image.asset("assets/about.jpg"),
              ),
              const SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("ALFAREL PUTRA ANSAR"),
                  SizedBox(height: 5),
                  Text("Politenik Astra"),
                  SizedBox(height: 5),
                  Text("Teknik Otomotif"),
                  SizedBox(height: 5),
                  Text("farrel.ansar@gmail.com"),
                  SizedBox(height: 5),
                  Text("0895610401559"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
