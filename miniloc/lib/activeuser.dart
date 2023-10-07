import 'user.dart';

// //attempt fetching username (failed)
// class Active {
//   final int id;
//   final User user;
//   final String login;

//   Active(
//       {required this.id, required this.user, required this.login});

//   factory Active.fromJson(Map<String, dynamic> json) =>
//       Active(
//         id: json["id"] as int,
//         user: User.fromJson(json["user"]),
//         login: json["user"]["login"]
//       );

//   Map<String, dynamic> toJson() =>
//       {
//         'id': id,
//         'user': user,
//         'login': login,
//       };
// }

class Active {
  final int id;
  final User user;

  Active(
      {required this.id, required this.user});

  factory Active.fromJson(Map<String, dynamic> json) =>
      Active(
        id: json["id"] as int,
        user: User.fromJson(json["user"])
      );

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'user': user,
      };
}