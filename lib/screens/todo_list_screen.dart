import 'package:flutter/material.dart';
import 'package:practice_code/screens/add_new_todo_screen.dart';
import 'package:practice_code/screens/update_todo_screen.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 20),
              child: ListTile(
                title: const Text('Here is a Title'),
                subtitle: const Text('Here is description'),
                leading: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text('status'),
                ),
                trailing: Wrap(
                  children: [
                    IconButton(
                      onPressed: () {
                        _showChangeStatusDialog();
                      },
                      icon: const Icon(Icons.mode_edit_outlined),
                    ),
                    IconButton(
                      onPressed: () {

                      },
                      icon: const Icon(Icons.delete_outline),
                    ),
                  ],
                ),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UpdateTodoScreen(),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNewTodoScreen(),
            ),
          );
        },
        backgroundColor: Colors.teal[200],
        elevation: 8,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
  void _showChangeStatusDialog(){
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Change Status'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Idle'),
              ),
              Divider(height: 0),
              ListTile(
                title: Text('In Progress'),
              ),
              Divider(height: 0),
              ListTile(
                title: Text('Complete'),
              ),

            ],
          ),
        );
      },
    );
  }
}


