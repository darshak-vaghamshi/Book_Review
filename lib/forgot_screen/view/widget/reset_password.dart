import 'package:flutter/material.dart';
import '../../../login_page/view/login_screen.dart';
import '../../../utils/widget/material_button.dart';
import '../../../utils/widget/text_field_widget.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool _obscureText = true;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
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
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 110,
                ),
                TextFieldWidget(
                  obscureText: _obscureText,
                  keyboardType: TextInputType.name,
                  controller: passwordController,
                  labelText: "New Password",
                  icon: _obscureText ? Icons.visibility_off : Icons.visibility,
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  obscureText: _obscureText,
                  keyboardType: TextInputType.name,
                  controller: confirmpasswordController,
                  labelText: "Confirm Password",
                  icon: _obscureText ? Icons.visibility_off : Icons.visibility,
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButtonBar(
                  bottonColor: Colors.blueGrey[600],
                  labelText: "Next",
                  onTapButton: () {
                    if (passwordController.text == "" ||
                        confirmpasswordController.text == "") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Required *"),
                          backgroundColor: Colors.blueGrey,
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
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
