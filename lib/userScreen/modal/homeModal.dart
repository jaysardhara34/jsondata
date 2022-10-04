class HomeModal {
  int? userId;
  int? id;
  String? title;
  String? body;

  HomeModal({this.userId, this.id, this.title, this.body});

  HomeModal fromJson(Map json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];

    HomeModal h1 = HomeModal(title: title, body: body, id: id, userId: userId);

    return h1;
  }
}
