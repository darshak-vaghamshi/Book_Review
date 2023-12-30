import 'package:flutter/material.dart';
import '../../../signup_page/view/signup_screen.dart';
import '../../../utils/widget/material_button.dart';
import '../login_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButtonBar(
                  bottonColor: Colors.blueGrey[600],
                  labelText: "Log In",
                  onTapButton: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    );
                  },
                ),
                MaterialButtonBar(
                  bottonColor: Colors.white.withOpacity(0.3),
                  labelText: "Sign Up",
                  onTapButton: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SignupScreen()),
                    );
                  },
                ),
                const SizedBox(
                  height: 100,
                  width: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
