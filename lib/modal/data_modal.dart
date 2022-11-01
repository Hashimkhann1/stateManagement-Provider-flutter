import 'dart:core';


class PostDataModal{
  int? userId;
  int? id;
  String? title;
  String? body;

  PostDataModal({
    this.title,
    this.id,
    this.body,
    this.userId,
});


  factory PostDataModal.formJSON(Map<String , dynamic> mapData){
    return PostDataModal(userId: mapData['userId'],id: mapData['id'],body: mapData['body'],title: mapData['title']);
  }
}