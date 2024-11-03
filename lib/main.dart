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

      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        // backgroundColor: Colors.greenAccent,
        indicatorColor: Colors.greenAccent,
        surfaceTintColor: Colors.green,
        shadowColor: Colors.green,
        onDestinationSelected: (int index) {
          //TODO: pending work
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
        ],
      ),

      body: ListView.builder(
        itemCount: friendList.length,
          itemBuilder: (BuildContext context, int index){
            return Padding(
              padding: EdgeInsets.all(16),
              child: Text(friendList[index]),
            );
          },
      ),

    );
  }
}
