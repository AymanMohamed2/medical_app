class DoctorModel {
  final String name;
  final String imageUrl;
  final String speciality;

  DoctorModel({
    required this.name,
    required this.imageUrl,
    required this.speciality,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      name: json['name'],
      imageUrl: json['imageUrl'] ??
          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80',
      speciality: json['speciality'] ?? 'general',
    );
  }
}
