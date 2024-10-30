import 'package:flutter/material.dart';
import 'package:flutter_notifications_tutorial/local_notifications.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Local Notifications"),
      ),
      body: Column(
        children: [
          ElevatedButton.icon(
            icon: Icon(Icons.notifications_outlined),
            onPressed: (){
              LocalNotifications.showSimpleNotification(
                title: "Simple Notifications", 
                body: "This is a simple notifications", 
                payload: "This is a simple Local Notifications",
                );
            },
            label: Text("Simple Notification"),
          )
        ],
      ),
    );
  }
}