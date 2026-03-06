// DATA LAYER: Pure data classes
class StudentModel {
  final String id;
  final String name;
  final String studentNumber;
  final String email;
  final String course;

  StudentModel({
    required this.id,
    required this.name,
    required this.studentNumber,
    required this.email,
    required this.course,
  });

  // Create StudentModel from Map (JSON)
  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      studentNumber: map['studentNumber'] ?? '',
      email: map['email'] ?? '',
      course: map['course'] ?? '',
    );
  }

  // Convert StudentModel to Map (JSON)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'studentNumber': studentNumber,
      'email': email,
      'course': course,
    };
  }
}

