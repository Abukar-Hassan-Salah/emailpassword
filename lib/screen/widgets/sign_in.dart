import 'package:emailpassword/screen/widgets/dashboard.dart';
import 'package:emailpassword/screen/widgets/sign_up.dart';
import 'package:emailpassword/screen/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final TextEditingController txtEmail = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Future<void> login() async {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: txtEmail.text, password: txtPassword.text);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const DashBoardPage()),
            (route) => false);
        print("success");
        // ignore: use_build_context_synchronously
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }

    return Scaffold(
      backgroundColor: const Color(0x000000ff),
      body: Container(
          margin: const EdgeInsets.symmetric(vertical: 80),
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Gap(100),
              Text(
                "Welcome Back",
                style: TextStyle(color: Colors.grey.shade200, fontSize: 32),
              ),
              const Gap(
                20,
              ),
              Text(
                "Sign In to Continue Your Icon",
                style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
              ),
              const Gap(20),
              CustomTextField(
                txtHint: "Email Address",
                iconData: FluentIcons.mail_16_regular,
                isPassword: false,
                controller: txtEmail,
              ),
              const Gap(20),
              CustomTextField(
                txtHint: "Password",
                iconData: FluentIcons.lock_closed_16_regular,
                isPassword: true,
                controller: txtPassword,
              ),
              const Gap(40),
              Text(
                "I gree with the terms of services & Privacy Policy",
                style: TextStyle(color: Colors.grey.shade500),
              ),
              const Gap(40),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5A00EC),
                      minimumSize: const Size(double.infinity, 60)),
                  onPressed: () {
                    login();
                  },
                  child: const Text("Log In Your Account",
                      style: TextStyle(color: Colors.white))),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
                  child: const Text("You Have No Account Create New Account"))
            ]),
          )),
    );
  }
}
