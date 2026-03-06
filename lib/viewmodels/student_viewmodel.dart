// LOGIC LAYER: State + Logic
import 'package:flutter/foundation.dart';
import '../models/student_model.dart';

class StudentViewModel extends ChangeNotifier {
  List<StudentModel> _students = [];
  
  // Getters
  List<StudentModel> get students => _students;
  
  // Add a student
  void addStudent(StudentModel student) {
    _students.add(student);
    notifyListeners();
  }
  
  // Remove a student
  void removeStudent(String id) {
    _students.removeWhere((student) => student.id == id);
    notifyListeners();
  }
  
  // Update a student
  void updateStudent(StudentModel updatedStudent) {
    final index = _students.indexWhere((s) => s.id == updatedStudent.id);
    if (index != -1) {
      _students[index] = updatedStudent;
      notifyListeners();
    }
  }
  
  // Get student by ID
  StudentModel? getStudentById(String id) {
    try {
      return _students.firstWhere((s) => s.id == id);
    } catch (e) {
      return null;
    }
  }
}

