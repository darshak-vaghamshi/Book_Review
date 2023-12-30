import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../utils/widget/text_field_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  String username = '';
  String email = '';
  String phoneNumber = '';

  Future<void> getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      email = user.email ?? '';

      final DocumentSnapshot<Map<String, dynamic>> userData =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .get();
      if (userData.exists) {
        username = userData.get('username');
        phoneNumber = userData.get('phoneNumber');
      }

      print('Username: $username');
      print('Email: $email');
      print('Phone Number: $phoneNumber');
      emailController.text = email;
      phoneNumberController.text = phoneNumber;
      usernameController.text = username;
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getUserData();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[600],
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.blueGrey[200],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 90,
              ),
              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/images/images.png'),
                      fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TextFieldWidget(
                        keyboardType: TextInputType.name,
                        controller: usernameController,
                        labelText: 'User Name',
                        icon: Icons.person_2_rounded,
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      TextFieldWidget(
                        keyboardType: TextInputType.name,
                        controller: emailController,
                        labelText: 'Email',
                        icon: Icons.email_rounded,
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      TextFieldWidget(
                        keyboardType: TextInputType.phone,
                        controller: phoneNumberController,
                        labelText: 'Phone Number',
                        icon: Icons.phone,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
