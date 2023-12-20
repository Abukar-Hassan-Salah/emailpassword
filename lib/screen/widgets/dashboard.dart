import 'package:emailpassword/screen/widgets/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x000000ff),
      body: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 80),
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome Dashboard",
                  style: TextStyle(color: Colors.grey.shade300, fontSize: 30),
                ),
                const Gap(12),
                Text("Personal Email:abukarhassansalah@gmail.com",
                    style: TextStyle(color: Colors.grey.shade300)),
                TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                          (route) => false);
                    },
                    child: (const Text("Logout",
                        style: TextStyle(color: Color(0xFFF0B3FD)))))
              ])),
    );
  }
}
