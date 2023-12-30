import 'dart:convert';
import 'package:book_review_2/repository/book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class Repository {
  String baseUrl = "https://api.itbook.store/1.0/";
  String bookUrl = 'new';

  Future<List<BookDetail>> getBookFetachData() async {
    final response = await http.get(Uri.parse('$baseUrl$bookUrl'));
    if (response.statusCode == 200) {
      print('BokkList--->>>> ${response.body}');
      return BookModel.fromJson(jsonDecode(response.body)).books ?? [];
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List<BookDetail>> bookSerachData({required String searchValue}) async {
    String serachUrl = 'search/$searchValue';
    final response = await http.get(Uri.parse('$baseUrl$serachUrl'));
    if (response.statusCode == 200) {
      print('SerachBokkList--->>>> ${response.body}');
      return BookModel.fromJson(jsonDecode(response.body)).books ?? [];
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<BookDetail> getBookDetailData({required String isbn13}) async {
    String bookDetailUrl = "books/$isbn13";
    final response = await http.get(Uri.parse('$baseUrl$bookDetailUrl'));
    if (response.statusCode == 200) {
      print('BokkList--->>>> ${response.body}');
      return BookDetail.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
