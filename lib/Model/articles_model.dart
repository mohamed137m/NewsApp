class ArticlesModel {
  final String? title;
  final String? subTitle;
  final String? imageUrl;
  ArticlesModel({
    required this.title,
    required this.subTitle,
    required this.imageUrl,
  });

  factory ArticlesModel.fromJson(json) {
    return ArticlesModel(
      title: json['title'],
      subTitle: json['description'],
      imageUrl: json['urlToImage'],
    );
  }
}
