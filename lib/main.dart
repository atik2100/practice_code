import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Responsive Todo App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: TodoPage(),
        );
      },
    );
  }
}

class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final List<String> _tasks = [];
  final TextEditingController _controller = TextEditingController();

  void _addTask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _tasks.add(_controller.text);
        _controller.clear();
      });
    }
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Todo App'),
        backgroundColor: Colors.teal,
      ),
      drawer: Drawer(
        child: Column(
          children: [

            Text('Home',style: TextStyle(

            ),),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input field and Add button
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Enter task',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 2.w), // Responsive spacing
                ElevatedButton(
                  onPressed: _addTask,
                  child: Text('Add'),
                ),
              ],
            ),
            SizedBox(height: 2.h), // Responsive vertical spacing
            // Responsive Layout for Task List
            Expanded(
              child: ScreenTypeLayout(
                mobile: _buildTaskListInListView(), // Mobile layout
                tablet: _buildTaskListInGrid(2),   // Tablet layout with 2 columns
                desktop: _buildTaskListInGrid(3),  // Desktop layout with 3 columns
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ListView for mobile screens
  Widget _buildTaskListInListView() {
    return ListView.builder(
      itemCount: _tasks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_tasks[index]),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => _deleteTask(index),
          ),
        );
      },
    );
  }

  // GridView for tablets and desktops
  Widget _buildTaskListInGrid(int columns) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 2.w,
        mainAxisSpacing: 2.h,
      ),
      itemCount: _tasks.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _tasks[index],
                  style: TextStyle(fontSize: 12.sp), // Responsive text size
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 1.h), // Spacing between text and button
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteTask(index),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

