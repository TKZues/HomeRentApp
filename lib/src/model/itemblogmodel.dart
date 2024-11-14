class BlogModel {
  int? userId;
  int? id;
  String? title;
  String? body;
 

  BlogModel({
    this.userId,
    this.id,
    this.title,
    this.body,

  });

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
  
    );
  }
}
