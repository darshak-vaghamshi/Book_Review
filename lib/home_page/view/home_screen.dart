import 'package:book_review_2/repository/book_api.dart';
import 'package:flutter/material.dart';
import '../../repository/book_model.dart';
import '../../utils/widget/book_image.dart';
import '../../utils/widget/drawer_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<BookDetail> bookList = [];
  List<BookDetail> serachData = [];

  bool isLoading = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        isLoading = true;
      });
      bookList = await Repository().getBookFetachData();
      serachData = bookList;

      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  Future<void> updateList(String value) async {
    if (value != '') {
      serachData = bookList
          .where((element) =>
              element.title!.toLowerCase().contains(value.toLowerCase()) ||
              element.price!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      serachData = bookList;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[600],
        title: const Text(
          "For You",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.blueGrey[200],
      drawer: MenuDrawer(serachData: serachData),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 15),
          child: TextField(
            onChanged: (value) => updateList(value),
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.blueGrey[400],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(19),
                borderSide: BorderSide.none,
              ),
              hintText: "eg: The Dark Knight",
              hintStyle: const TextStyle(color: Colors.white),
              prefixIcon: const Icon(Icons.search),
              prefixIconColor: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.blueGrey,
                ))
              : serachData.isEmpty
                  ? const Center(
                      child: Text(
                      'No Book Data',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ))
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: serachData.length,
                      itemBuilder: (context, index) => BookImage(
                        bookData: serachData[index],
                      ),
                    ),
        ),
      ]),
    );
  }
}
