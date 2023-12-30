import 'dart:developer';
import 'package:book_review_2/home_page/view/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../utils/widget/material_button.dart';
import '../../utils/widget/text_field_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phonedController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> _register() async {
    try {
      final String username = usernameController.text;
      final String phoneNumber = phonedController.text;
      final String email = emailController.text;
      final String password = passwordController.text;

      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user?.uid)
          .set({
        'username': username,
        'phoneNumber': phoneNumber,
      });
      log('singUser---- $userCredential');

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Sign up Successfully'),
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
      print('Failed to register: $e');
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 39,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  TextFieldWidget(
                    keyboardType: TextInputType.name,
                    controller: usernameController,
                    labelText: "Username",
                    icon: Icons.person_2_rounded,
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  TextFieldWidget(
                    keyboardType: TextInputType.name,
                    controller: emailController,
                    labelText: "Email",
                    icon: Icons.email_rounded,
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  TextFieldWidget(
                    keyboardType: TextInputType.phone,
                    controller: phonedController,
                    maxLength: 10,
                    labelText: "Phone number",
                    icon: Icons.phone,
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  TextFieldWidget(
                    obscureText: _obscureText,
                    keyboardType: TextInputType.name,
                    controller: passwordController,
                    maxLength: 12,
                    labelText: "Password",
                    icon:
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButtonBar(
                    bottonColor: Colors.blueGrey[600],
                    labelText: "Sign Up",
                    onTapButton: () {
                      _register();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
