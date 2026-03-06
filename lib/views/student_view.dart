// UI LAYER: Screens
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/student_model.dart';
import '../viewmodels/student_viewmodel.dart';

class StudentView extends StatelessWidget {
  const StudentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Info App'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Consumer<StudentViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.students.isEmpty) {
            return const Center(
              child: Text('No students added yet'),
            );
          }
          
          return ListView.builder(
            itemCount: viewModel.students.length,
            itemBuilder: (context, index) {
              final student = viewModel.students[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(student.name),
                  subtitle: Text('${student.studentNumber} - ${student.course}'),
                  trailing: Text(student.email),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddStudentDialog(context),
        tooltip: 'Add Student',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddStudentDialog(BuildContext context) {
    final nameController = TextEditingController();
    final numberController = TextEditingController();
    final emailController = TextEditingController();
    final courseController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Student'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: numberController,
              decoration: const InputDecoration(labelText: 'Student Number'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: courseController,
              decoration: const InputDecoration(labelText: 'Course'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final student = StudentModel(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                name: nameController.text,
                studentNumber: numberController.text,
                email: emailController.text,
                course: courseController.text,
              );
              context.read<StudentViewModel>().addStudent(student);
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}

