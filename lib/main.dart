import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'my practice app',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  Home({super.key});

  List<String> friendList = [
    'Atik',
    'Shahriar',
    'Atia',
    'Sanzida',
    'Farjana',
    'Sharmin',
    'Kanta',
    'Abdullah',
    'Al',
    'Sakil',
    'Atik',
    'Shahriar',
    'Atia',
    'Sanzida',
    'Farjana',
    'Sharmin',
    'Kanta',
    'Abdullah',
    'Al',
    'Sakil'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.lightGreen,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.greenAccent.shade100,
        child: Column(
          children: [Text('Hello Atik')],
        ),
      ),
      body: ListView.builder(
        itemCount: friendList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(friendList[index]),
            titleTextStyle: TextStyle(
              fontSize: 18,
              color: Colors.deepOrange,
            ),
            subtitle: Text('Friend no: $index'),
            subtitleTextStyle: TextStyle(
              fontSize: 12,
              color: Colors.purple,
            ),
            trailing: Icon(
              Icons.arrow_forward,
              color: Colors.red,
            ),
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            onTap: (){
              print('index no $index');
              print('name: '+friendList[index]);
            },
          );
        },
      ),
    );
  }
}
