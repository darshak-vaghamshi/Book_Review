import 'dart:convert';
import 'package:book_review_2/repository/book_search.dart';
import 'package:http/http.dart' as http;

class SearchRepository {
  String searchUrl = "https://api.itbook.store/1.0/search/mongodb";

  Future<List<Searchs>> getSearchFetachData() async {
    final response = await http.get(Uri.parse(searchUrl));
    if (response.statusCode == 200) {
      print('BokkList--->>>> ${response.body}');
      return Search.fromJson(jsonDecode(response.body)).searchs ?? [];
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
