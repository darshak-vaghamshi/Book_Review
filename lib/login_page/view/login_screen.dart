import 'dart:developer';
import 'package:book_review_2/home_page/view/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../utils/widget/material_button.dart';
import '../../utils/widget/text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> _signInWithEmailAndPassword() async {
    try {
      final String email = emailController.text;
      final String password = passwordController.text;
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      log('USerCredential--- ${userCredential.user}');

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Login Successfully'),
        backgroundColor: Colors.green,
      ));
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('$e'),
        backgroundColor: Colors.red,
      ));
      print('Failed to sign in: $e');
    }
  }

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Log In",
                      style: TextStyle(
                          fontSize: 39,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 90,
                ),
                TextFieldWidget(
                  keyboardType: TextInputType.name,
                  controller: emailController,
                  labelText: "Email",
                  icon: Icons.email_rounded,
                  onTap: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  obscureText: _obscureText,
                  keyboardType: TextInputType.name,
                  controller: passwordController,
                  labelText: "Password",
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
                  labelText: "Log In",
                  onTapButton: () => _signInWithEmailAndPassword(),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
