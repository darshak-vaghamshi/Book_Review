import 'package:book_review_2/like_screen/view/like_screen.dart';
import 'package:book_review_2/profile_page/view/profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../about_page/view/about_screen.dart';
import '../../login_page/view/widget/splash_login_signup.dart';
import '../../repository/book_model.dart';
import 'material_button.dart';
import 'menu_list_tile.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key, required this.serachData});
  final List<BookDetail> serachData;
  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  String username = '';

  Future<void> getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final DocumentSnapshot<Map<String, dynamic>> userData =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .get();
      if (userData.exists) {
        username = userData.get('username');
        setState(() {});
      }
      print('Username: $username');
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      print('BookData---- ${widget.serachData.length}');
      await getUserData();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blueGrey[600],
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(style: BorderStyle.solid))),
              child: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/images/images.png'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Welcome',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                username != ''
                                    ? '${username[0].toUpperCase()}${username.substring(1)}'
                                    : '',
                                maxLines: 2,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            MenuListTile(
              icon: Icons.person_2_rounded,
              labelText: "Profile",
              onTapButton: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfileScreen()),
                );
              },
            ),
            MenuListTile(
              icon: Icons.favorite_border,
              labelText: "Like",
              onTapButton: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LikeScreen(
                      serachData: widget.serachData,
                    ),
                  ),
                );
              },
            ),
            MenuListTile(
              icon: Icons.announcement_rounded,
              labelText: "About",
              onTapButton: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AboutScreen()),
                );
              },
            ),
            const SizedBox(
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(49),
              child: Center(
                child: MaterialButtonBar(
                  bottonColor: Colors.grey.withOpacity(0.4),
                  labelText: "Log Out",
                  onTapButton: () => _signOut(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();

      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('$e'),
        backgroundColor: Colors.red,
      ));
      // Handle errors here (e.g., display an error message)
      print('Error during logout: $e');
    }
  }
}
