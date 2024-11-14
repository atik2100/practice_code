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
  TextEditingController _EmailTEController = TextEditingController();
  TextEditingController _PasswordTEController = TextEditingController();
  GlobalKey<FormState> _fromkey = GlobalKey<FormState>();

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
      /*body: ListView.separated(
          itemCount: friendList.length,
        itemBuilder: (context, index){
            return Column(
              children: [
                Text(friendList[index]),
              ],
            );
        },

        separatorBuilder: (context, index){
            return Divider(
              height: 30,
            );
        },
      ),*/
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 100,
                width: 100,
                color: Colors.purple,
                margin: EdgeInsets.all(24),
              ),
              Container(
                height: 100,
                width: 100,
                margin: EdgeInsets.all(24),
                decoration: BoxDecoration(
                    // borderRadius:BorderRadius.circular(16),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(42),
                      bottomRight: Radius.circular(42),
                    ),
                    color: Colors.purple,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]),
              ),
            ],
          ),
          Container(
            height: 100,
            width: 100,
            margin: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.purple,
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('assets/images/insta.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
