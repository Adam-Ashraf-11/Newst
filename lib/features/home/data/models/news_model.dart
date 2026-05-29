
class NewsModel {
  final String title;
  final String description;
  final String? urlToImage;
  final String author;
  final String content;
  final String publishedAt;
  final String url;

  NewsModel({
    required this.title,
    required this.description,
     this.urlToImage,
    required this.author,
    required this.content,
    required this.publishedAt,
    required this.url,
  });

  Map<String, dynamic> tojson() => {
    'title': title,
    'description': description,
    'urlToImage': urlToImage,
    'author': author,
    'content': content,
    'publishedAt': publishedAt,
    'url': url,
  };

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
    title: json['title'] ?? '',
    description: json['description'] ?? '',
    urlToImage: json['urlToImage'] ?? '',
    author: json['author'] ?? '',
    content: json['content'] ?? '',
    publishedAt: json['publishedAt'] ?? '',
    url: json['url'] ?? '',
  );
}



  // {
  //           "source": {
  //               "id": null,
  //               "name": "Gizmodo.com"
  //           },
  //           "author": "Kyle Torpey",
  //           "title": "SpaceX Holds More Bitcoin Than Previously Thought",
  //           "description": "To the Moon.",
  //           "url": "https://gizmodo.com/spacex-holds-more-bitcoin-than-previously-thought-2000762104",
  //           "urlToImage": "https://gizmodo.com/app/uploads/2026/02/falcon-9-launch-1200x675.jpeg",
  //           "publishedAt": "2026-05-21T20:45:52Z",
  //           "content": "In a filing with the U.S. Securities and Exchange Commission (SEC), SpaceX has revealed that it holds 18,712 bitcoin, currently worth around $1.45 billion. Although Elon Musk previously revealed that… [+4091 chars]"
  //       },