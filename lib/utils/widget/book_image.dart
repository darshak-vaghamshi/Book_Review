import 'dart:developer';
import 'package:flutter/material.dart';
import '../../home_page/view/widget/book_read.dart';
import '../../repository/book_api.dart';
import '../../repository/book_model.dart';

class BookImage extends StatefulWidget {
  const BookImage({super.key, required this.bookData});
  final BookDetail bookData;

  @override
  State<BookImage> createState() => _BookImageState();
}

class _BookImageState extends State<BookImage> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final bookDetail = await Repository()
            .getBookDetailData(isbn13: widget.bookData.isbn13 ?? '');
        setState(() {});
        log('bookDetail--- ${bookDetail.toJson()}');
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BookRead(
              bookDetail: bookDetail,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                widget.bookData.image ?? '',
                height: 90,
              ),
              Expanded(
                child: Text(
                  widget.bookData.title ?? '',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        if (widget.bookData.like == 0) {
                          widget.bookData.like = 1;
                        } else {
                          widget.bookData.like = 0;
                        }
                        setState(() {});
                      },
                      icon: Icon(
                        widget.bookData.like == 0
                            ? Icons.favorite_border
                            : Icons.favorite,
                        color: Colors.pinkAccent,
                        size: 20,
                      )),
                  Container(
                    padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                    decoration: BoxDecoration(
                        color: Colors.amber.shade800,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      widget.bookData.price ?? '',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              )
            ],
          ),
        ),
      ),
    );
  }
}
