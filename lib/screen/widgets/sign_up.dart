import 'package:emailpassword/screen/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final TextEditingController _txtEmail = TextEditingController();
  final TextEditingController _txtPassword = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Future<void> createuser() async {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _txtEmail.text,
          password: _txtPassword.text,
        );
        print("success");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0x000000ff),
        body: Container(
            margin: const EdgeInsets.symmetric(vertical: 80),
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(100),
                    Text(
                      "Create Account",
                      style:
                          TextStyle(color: Colors.grey.shade200, fontSize: 32),
                    ),
                    const Gap(
                      20,
                    ),
                    Text(
                      "Please Enter Data To Create An Account",
                      style:
                          TextStyle(fontSize: 16, color: Colors.grey.shade500),
                    ),
                    const Gap(20),
                    CustomTextField(
                      txtHint: "Email Address",
                      iconData: FluentIcons.mail_16_regular,
                      isPassword: false,
                      controller: _txtEmail,
                    ),
                    const Gap(20),
                    CustomTextField(
                      txtHint: "Password",
                      iconData: FluentIcons.lock_closed_16_regular,
                      isPassword: true,
                      controller: _txtPassword,
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
                          createuser();
                        },
                        child: const Text(
                          "Create Account",
                          style: TextStyle(color: Colors.white),
                        ))
                  ]),
            )),
      ),
    );
  }
}
