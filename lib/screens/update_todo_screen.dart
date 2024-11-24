import 'package:flutter/material.dart';

class UpdateTodoScreen extends StatefulWidget {
  const UpdateTodoScreen({super.key});

  @override
  State<UpdateTodoScreen> createState() => _UpdateTodoScreenState();
}

class _UpdateTodoScreenState extends State<UpdateTodoScreen> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descreptionTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Todo'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _titleTEController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Enter Your Title';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Todo Title',
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: 'Title',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _descreptionTEController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Enter Your Description';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Todo Description',
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: 'Description',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Update'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
