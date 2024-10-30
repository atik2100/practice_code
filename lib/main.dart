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
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shadowColor: Colors.blueGrey,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.white60, width: 1),
                ),
              ),
              onPressed: () {
                showDialog(
                    barrierColor: Colors.brown,
                    barrierDismissible: true,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Delete'),
                        backgroundColor: Color(0xFFA7DD9B),
                        content: Text('Are you sure'),
                        actions: [
                          TextButton(onPressed: () {}, child: Text('Yes')),
                          TextButton(onPressed: () {}, child: Text('No')),
                        ],
                      );
                    });
              },
              child: Text('Tap here'),
            ),
            SizedBox(height: 32),
            TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blue,
                  textStyle: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationThickness: 2,
                  ),
                ),
                onPressed: () {
                  print('tapped text button');
                },
                child: Text('Text button')),
            SizedBox(height: 32),
            IconButton(
              style: IconButton.styleFrom(),
              onPressed: () {
                print('tapped icon button');
              },
              icon: Icon(Icons.add),
            ),
            SizedBox(height: 32),
            OutlinedButton(
              style: OutlinedButton.styleFrom(),
              onPressed: () {
                print('tapped outline button');
              },
              child: Text('Outline Button'),
            ),
            SizedBox(height: 32),
            GestureDetector(
              onTap: () {
                print('one tap');
              },
              onDoubleTap: () {
                print('double tap');
              },
              onLongPress: () {
                print('long press');
              },
              onLongPressEnd: (Details) {
                print('long press end');
              },
              onHorizontalDragDown: (Details) {
                print('horizontal');
              },
              child: Column(
                children: [
                  Text('A simple Text'),
                ],
              ),
            ),
            InkWell(
              splashColor: Colors.blue,
              onTap: () {
                print('ink well');
              },
              child: Text('A Ink Well Text'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('tapped fab button');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
