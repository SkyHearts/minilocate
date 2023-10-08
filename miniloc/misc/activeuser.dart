import 'user.dart';

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