import 'package:flutter/material.dart';
import '../../repository/book_model.dart';
import '../../utils/widget/book_image.dart';

class LikeScreen extends StatefulWidget {
  LikeScreen({super.key, required this.serachData});
  List<BookDetail> serachData;

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  List<BookDetail> likeData = [];
  @override
  void initState() {
    likeData = widget.serachData.where((element) => element.like == 1).toList();
    print('BookData like---- ${likeData.length}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[600],
        title: const Text(
          "Like",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.blueGrey[200],
      body: likeData.isEmpty
          ? const Center(
              child: Text(
                'No Book Data',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: likeData.length,
              itemBuilder: (context, index) => BookImage(
                bookData: likeData[index],
              ),
            ),
    );
  }
}
