import 'package:flutter/material.dart';
import 'package:practice_code/models/todo.dart';
import 'package:practice_code/screens/add_new_todo_screen.dart';
import 'package:practice_code/screens/update_todo_screen.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<Todo> listOfTodo = [];

  void _addTodo(Todo todo) {
    listOfTodo.add(todo);
    setState(() {});
  }

  void _deleteTodo(int index) {
    listOfTodo.removeAt(index);
    setState(() {});
  }

  void _updateTodo(int index, Todo todo) {
    listOfTodo[index] = todo;
    setState(() {});
  }

  void _updateTodoStatus(int index, TodoStatus status) {
    listOfTodo[index].status = status;
    setState(() {});
  }
  String _statusToString (TodoStatus status){
    if (status == TodoStatus.idle){
      return 'Idle';
    } else if ( status == TodoStatus.inProgress){
      return 'In Progress';
    } return 'Complete';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Visibility(
          visible: listOfTodo.isNotEmpty,
          replacement: Center(
            child: Image.asset('assets/images/no_data.jpg'),
          ),
          child: ListView.builder(
            itemCount: listOfTodo.length,
            itemBuilder: (context, index) {
              Todo todo = listOfTodo[index];
              return Card(
                elevation: 4,
                margin: const EdgeInsets.only(bottom: 20),
                child: ListTile(
                  title:  Text(todo.title),
                  subtitle:  Text(todo.description),
                  leading: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(_statusToString(todo.status)),
                  ),
                  trailing: Wrap(
                    children: [
                      IconButton(
                        onPressed: () {
                          _showChangeStatusDialog(index);
                        },
                        icon: const Icon(Icons.mode_edit_outlined),
                      ),
                      IconButton(
                        onPressed: () {
                          _deleteTodo(index);
                        },
                        icon: const Icon(Icons.delete_outline),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateTodoScreen(
                          todoToBeUpdated: todo,
                          onUpdateTodo: (Todo updatedTodo) {
                            _updateTodo(index, updatedTodo);
                          },
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          Todo? todo = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNewTodoScreen(),
            ),
          );
          if(todo != null){
            _addTodo(todo);
          }
        },
        backgroundColor: Colors.teal[200],
        elevation: 8,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showChangeStatusDialog(int index) {
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
                onTap: () {
                  _onTapUpdateStatusButton(index, TodoStatus.idle);
                },
              ),
              Divider(height: 0),
              ListTile(
                title: Text('In Progress'),
                onTap: () {
                  _onTapUpdateStatusButton(index, TodoStatus.inProgress);
                },
              ),
              Divider(height: 0),
              ListTile(
                title: Text('Complete'),
                onTap: () {
                  _onTapUpdateStatusButton(index, TodoStatus.complete);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _onTapUpdateStatusButton(int index, TodoStatus status) {
    _updateTodoStatus(index, status);
    Navigator.pop(context);
  }
}
