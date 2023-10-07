import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:oauth2/oauth2.dart' as oauth2;
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'activeuser.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<Active> userList = <Active>[];
  List<Active> activeUsers = <Active>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MiniLocate - Who\'s on Campus?'),
      ),
      body: ListView.builder(
        itemCount: activeUsers.length,
        itemBuilder: (context, index) {
          final user = activeUsers[index];
          final name = user.user.displayname;
          // final login = user.user.login; //attempt fetching username (failed)
          final id = user.id;
          return ListTile(
            title: Text(name),
            // subtitle: Text(login), //attempt fetching username (failed)
            subtitle: Text('ID: ${id.toString()}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchAccessToken,
      ),
    );
  }
// }

  List<Active> getActiveUsersFromJson(response) {
    print('Retrieving Current Active Users');
    List<Active> userList = <Active>[];
    // iterate through the list of json
    for (var json in response){
      // add the user object to your list
      userList.add(Active.fromJson(json));
    }
    // print(userList[1].user);
    // for(var i = 0; i < userList.length; i++){
    //   print("${userList[i].user.displayname} ID:${userList[i].id}");
    // }
    print('Retrieved Current Active Users');
    // return the list of users
    return userList;
  }

  void getAllUsers(var client, Directory apiData) async{
    print('Passing through getAllUsers');
    // List <dynamic> userList = [];
    String token = client.credentials.accessToken;
    print('token: $token');
    String link = 'https://api.intra.42.fr/v2/campus/34/locations?filter[active]=true&per_page=100&page=1&access_token=$token';
    var response = await client.read(Uri.parse(link));

    // userList = jsonDecode(response); //not sure if needed

    String apiDataPath = apiData.path;
    final File userData = File('$apiDataPath/users.json');
    print('userDataPath: $apiDataPath');
    await userData.writeAsString(response);
    // List<Active> activeUsers = getActiveUsersFromJson(jsonDecode(response));
    activeUsers = getActiveUsersFromJson(jsonDecode(response));
    print('Exited getAllUsers');
  }

    Future<void> fetchAccessToken() async{
    const uid = 'u-s4t2ud-793533b27f87b927036728996bc2d6b8b39eef72cf245943f8e4ff1b322a38ea';
    const secret = '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';
    print(uid);

    Directory apiData = await getApplicationDocumentsDirectory();
    // String apiDataPath = apiData.path;
    // final File userData = File('$apiDataPath/users.json');

    // This URL is an endpoint that's provided by the authorization server. It's
    // usually included in the server's documentation of its OAuth2 API.
    final authorizationEndpoint =
    Uri.parse('https://api.intra.42.fr/oauth/token?grant_type=client_credentials&client_id=$uid&client_secret=$secret');


    // Calling the top-level `clientCredentialsGrant` function will return a
    // [Client] instead.
    var client = await oauth2.clientCredentialsGrant(
        authorizationEndpoint, uid, secret);

    //send request to 42API, fetch campus user data
    getAllUsers(client, apiData);
    String userDataPath = '${apiData.path}/user.json';
    print(userDataPath);
    // print(activeUsers[2].user.displayname); //user display name
    // print(activeUsers[2].user.id); //user id
  }
}