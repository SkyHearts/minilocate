// import 'package:json_annotation/json_annotation.dart';
import 'image.dart';

// //attempt fetching username (failed)
// class User {
//   final int id;
//   final String displayname, url, login;
//   final bool active;

//   User({required this.id, required this.displayname, required this.url, required this.login, required this.active});
//   factory User.fromJson(Map<String, dynamic> json) => User(
//     id: json["id"] as int,
//     displayname: json["displayname"] as String,
//     url: json["url"] as String,
//     login: json["login"] as String,
//     active: json["active?"] as bool,
//   );
//   Map<String, dynamic> toJson() => {
//     'id': id,
//     'displayname': displayname,
//     'url': url,
//     'login': login,
//     'active': active,
//   };

class User {
  final int id;
  final String displayname, url, login;
  final bool active;
  final Images image;

  User({required this.id, required this.displayname, required this.url, required this.login, required this.active, required this.image});
  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] as int,
    displayname: json["displayname"] as String,
    url: json["url"] as String,
    login: json["login"] as String,
    active: json["active?"] as bool,
    image : Images.fromJson(json["image"]),
  );
  Map<String, dynamic> toJson() => {
    'id': id,
    'displayname': displayname,
    'url': url,
    'login': login,
    'active': active,
    'image': image,
  };
}
//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//         userId: json['id'],
//         name: json['displayname'],
//         url: json['url'],
//         active: json['active?']);
//   }
  
//   Map<String, dynamic> toJson() {
//     return {
//       "id": userId,
//       "name": name,
//       "url": url,
//       "active": active
//     };
//   }
// }