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
                showModalBottomSheet(
                    context: context,
                    builder: (ctx) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Title',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          Divider(
                            height: 20,
                            thickness: 4,
                          ),
                          Text('Here is a dialog'),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                  onPressed: () {}, child: Text('No')),
                              ElevatedButton(
                                  onPressed: () {}, child: Text('Yes')),
                            ],
                          ),
                        ],
                      );
                    });
              },
              child: Text('Tap here'),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                maxLines: 1,
                textAlign: TextAlign.center,
                maxLength: 50,
                onChanged: (String? value) {
                  print(value);
                },
                decoration: InputDecoration(
                  label: Text('Phone Number'),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  hintText: 'input your phone number',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                  prefixIcon: Icon(Icons.phone),
                  suffixIcon: Icon(Icons.person),
                  suffixIconColor: Colors.greenAccent,
                ),
                keyboardType: TextInputType.phone,
                enabled: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
