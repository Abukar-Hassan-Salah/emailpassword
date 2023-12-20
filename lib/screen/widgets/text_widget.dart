// ignore: unused_import
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.txtHint,
    required this.iconData,
    required this.isPassword,
    required this.controller,
  });
  final String txtHint;
  final IconData iconData;
  final bool isPassword;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: const BoxDecoration(
          color: Color(0xFF222222),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: [
            Icon(
              iconData,
              color: Colors.grey.shade300,
            ),
            const Gap(5),
            Expanded(
              child: TextField(
                obscureText: isPassword,
                controller: controller,
                decoration: InputDecoration(
                  hintText: txtHint,
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 198, 188, 188)),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                style:
                    const TextStyle(color: Color.fromARGB(255, 169, 174, 176)),
              ),
            ),
          ],
        ));
  }
}
