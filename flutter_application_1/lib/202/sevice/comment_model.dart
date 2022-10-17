class CommentModel {
  int? userId;
  int? id;
  String? title;
  String? body;
  String? email;

  CommentModel({this.userId, this.id, this.title, this.body, this.email});
//Hiçbir zaman buraya kod yazma
  CommentModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
    body = json['email'];
  }
//Hiçbir zaman buraya kod yazma
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    data['email'] = email;
    return data;
  }
}
