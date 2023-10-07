import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:oauth2/oauth2.dart' as oauth2;
import 'dart:convert';
import './activeuser.dart';

void getAllUsers(var client) async{
  print('Enter getAllUsers');
  // int i = 0;
  List <dynamic> userList = [];
  String token = client.credentials.accessToken;
  // dynamic response;
  print('token: $token');
  // while (i < 12){
  //     print('loop $i');
      // String link = 'https://api.intra.42.fr/v2/campus/34/locations?filter[active]=true&per_page=100&page=$i&access_token=$token';
      String link = 'https://api.intra.42.fr/v2/campus/34/locations?filter[active]=true&per_page=100&page=1&access_token=$token';
      // print(link);
      // var response = await client.read(Uri.parse('https://api.intra.42.fr/v2/campus/34/users?per_page=100&page=$i&access_token=$token'));
      final response = await client.read(Uri.parse(link));
      print(response);
      print('\n\nresponse\n');
      // print(response.runtimeType);
      // print(response.toString());
      userList = jsonDecode(response);
      // userList = response['user'];
      // print(userList);
      // print('\n\nuserlist\n');
  //     i += 1; 
  // }
  final File userData = File('./users.json');
  // await userData.writeAsString(client.credentials.toJson());
  await userData.writeAsString(response);

  List<Active> activeUsers =getActiveUsersFromJson(jsonDecode(response));
  // print(activeUsers[2].user.displayname); //user display name
  // print(activeUsers[2].user.id); //user id


  print('Exit getAllUsers');
}

Future<void> fetchAccessToken() async{
  const uid = 'u-s4t2ud-793533b27f87b927036728996bc2d6b8b39eef72cf245943f8e4ff1b322a38ea';
  const secret = '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';
  print(uid);
  // final credentialsFile = File('~/.myapp/credentials.json');
  // This URL is an endpoint that's provided by the authorization server. It's
  // usually included in the server's documentation of its OAuth2 API.
  final authorizationEndpoint =
  Uri.parse('https://api.intra.42.fr/oauth/token?grant_type=client_credentials&client_id=$uid&client_secret=$secret');


  // Calling the top-level `clientCredentialsGrant` function will return a
  // [Client] instead.
  var client = await oauth2.clientCredentialsGrant(
      authorizationEndpoint, uid, secret);

  getAllUsers(client);
}

List<Active> getActiveUsersFromJson(response) {
  List<Active> userList = <Active>[];
  // iterate through the list of json
  for (var json in response){
    // add the user object to your list
    userList.add(Active.fromJson(json));
  }
  // print(userList[1].user);
  for(var i = 0; i < userList.length; i++){
    // print(userList[i].user);
    print("${userList[i].user.displayname} ID:${userList[i].id}");
  }
  // return the list of users
  return userList;
}
//  List<User> users =getUsersFromJson(jsonDecode(response));s

void main() {
  fetchAccessToken();
}