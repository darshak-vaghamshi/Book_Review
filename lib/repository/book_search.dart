class Search {
  String? error;
  String? total;
  String? page;
  List<Searchs>? searchs;

  Search({this.error, this.total, this.page, this.searchs});

  Search.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    total = json['total'];
    page = json['page'];
    if (json['books'] != null) {
      searchs = <Searchs>[];
      json['books'].forEach((v) {
        searchs!.add(new Searchs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['total'] = this.total;
    data['page'] = this.page;
    if (this.searchs != null) {
      data['books'] = this.searchs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Searchs {
  String? title;
  String? subtitle;
  String? isbn13;
  String? price;
  String? image;
  String? url;

  Searchs(
      {this.title,
      this.subtitle,
      this.isbn13,
      this.price,
      this.image,
      this.url});

  Searchs.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
    isbn13 = json['isbn13'];
    price = json['price'];
    image = json['image'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['isbn13'] = this.isbn13;
    data['price'] = this.price;
    data['image'] = this.image;
    data['url'] = this.url;
    return data;
  }
}
