class News {
  String id;
  String title;
  String description;
  String url;
  String image;
  String author;
  String language;
  List<dynamic> category;
  String published;

  News.fromJson(Map<String, dynamic> json)
      : assert(json['id'] != null),
        assert(json['title'] != null),
        assert(json['description'] != null),
        assert(json['url'] != null),
        assert(json['author'] != null),
        assert(json['image'] != null),
        assert(json['language'] != null),
        assert(json['category'] != null),
        assert(json['published'] != null),
        this.id = json['id'],
        this.title = json['title'],
        this.description = json['description'],
        this.url = json['url'],
        this.author = json['author'],
        this.image = json['image'],
        this.language = json['language'],
        this.category = json['category'],
        this.published = json['published'];
}
