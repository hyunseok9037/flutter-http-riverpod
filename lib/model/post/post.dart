import 'package:http_riverpod/model/user/user.dart';

class Post{
  int? userId;
  int? id;
  String? title;
  String? body;
  User? user;

  Post({this.userId, this.id, this.title, this.body, this.user});

  //Json을 object로 바꾸어줌
  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      userId : json['userId'],
      id : json['id'],
      title : json['title'],
      body : json['body'],
      user : User.fromJson(json["user"])
    );
  }
  // toJson(); //object를 json으로 바꾸어줌
  Map<String,dynamic> toJson(){
    return {
      'userId' : userId,
      'id' : id,
      'title' : title,
      'body' : body,
      'user' :user?.toJson()
    };
  }
}