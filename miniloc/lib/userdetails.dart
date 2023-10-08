// import 'dart:io';

import 'package:flutter/material.dart';
import 'activeuser.dart';
// import 'package:url_launcher/url_launcher.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key, required this.activeUsers});
  final Active activeUsers;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        // title: Text(activeUsers.user.displayname),
      ),
      // body: const Center(child: Text('Profile')),
      body: Column(
        children: [
          Text(activeUsers.user.displayname, textAlign: TextAlign.start, textScaleFactor: 1.8,),
          Text(activeUsers.user.url, textAlign: TextAlign.left, textScaleFactor: 1.5,),
        ],
      ),
    );
  }
}