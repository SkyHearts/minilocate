// import 'dart:io';

import 'package:flutter/material.dart';
import 'activeuser.dart';
import 'package:url_launcher/url_launcher.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key, required this.activeUsers});
  final Active activeUsers;

// Function to open a URL
  Future <void> _launchURL(String url) async {
    await canLaunchUrl(Uri.parse(url)) 
      ? await launchUrl(Uri.parse(url))
      : throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(225, 108, 206, 234),
      appBar: AppBar(
        title: const Text('Details'),
        // title: Text(activeUsers.user.displayname),
      ),
      // body: const Center(child: Text('Profile')),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40,),
            CircleAvatar(
              radius: 118,
              child: CircleAvatar(
                radius: 115,
                backgroundImage: NetworkImage(activeUsers.user.image.ver.large),
              ),
            ),
            const SizedBox(height: 20,),
            Text(activeUsers.user.displayname, textAlign: TextAlign.center, textScaleFactor: 1.8,),
            // Text(activeUsers.user.url, textAlign: TextAlign.left, textScaleFactor: 1.5,),
            InkWell(
              onTap: (){
                _launchURL(activeUsers.user.url);
              },
              child: const Text('Intra Profile', style: TextStyle(
                  color: Color.fromARGB(255, 10, 64, 108), // Set text color to blue for a link-like appearance
                  decoration: TextDecoration.underline, // Add underline for a link-like appearance
                  fontSize: 25
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}