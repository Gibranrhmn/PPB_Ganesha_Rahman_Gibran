import 'package:flutter/material.dart';

class GridViewApp extends StatefulWidget {
  const GridViewApp({super.key});

  @override
  State<GridViewApp> createState() => _GridViewAppState();
}

class _GridViewAppState extends State<GridViewApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text('Prakktikum 4'),
        backgroundColor: Colors.blueAccent[700],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: EdgeInsets.all(12),
        children: [
          Container(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Icon(Icons.add),
                Text('GridView 1'),
              ],
            ), 
            color: Colors.amberAccent,
          ),
           Container(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(Icons.ac_unit),
                Text('GridView 2'),
              ],
            ), 
            color: const Color.fromARGB(255, 86, 255, 64),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('GridView 3'),
            color: const Color.fromARGB(255, 64, 163, 255),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('GridView 4'),
            color: const Color.fromARGB(255, 201, 64, 255),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('GridView 5'),
            color: const Color.fromARGB(255, 255, 64, 64),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('GridView 6'),
            color: const Color.fromARGB(255, 64, 249, 255),
          ),
        ],
      ),
    );
  }
}