import 'package:flutter/material.dart';

import '../../utils/widget/material_button.dart';
import '../../utils/widget/text_field_widget.dart';
import 'widget/reset_password.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bk5.webp"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 110,
                ),
                TextFieldWidget(
                  controller: emailController,
                  labelText: "Email",
                  icon: Icons.email_rounded,
                  onTap: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButtonBar(
                  bottonColor: Colors.blueGrey[600],
                  labelText: "Next",
                  onTapButton: () {
                    if (emailController.text == "") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Required *"),
                          backgroundColor: Colors.blueGrey,
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ResetPassword()),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
