import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: const Color.fromARGB(255, 235, 235, 235),
        child: Column(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text("aaaaa"),
                  Text("aaaaa"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
