class NewsItem {
  final int id;
  final String title;
  final String body;
  final String imageUrl;

  NewsItem({
    required this.id,
    required this.title,
    required this.body,
    required this.imageUrl
  });

  factory NewsItem.fromJson(Map<String, dynamic> json) {
    return NewsItem(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      imageUrl: json['imageUrl']
    );
  }
}