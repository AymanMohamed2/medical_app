import 'dart:developer';

class DoctorModel {
  final String name;
  final String imageUrl;
  final String speciality;
  final String id;
  DoctorModel({
    required this.name,
    required this.imageUrl,
    required this.id,
    required this.speciality,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    log(json['name'].toString());
    log(json['uId'].toString());
    return DoctorModel(
      name: json['name'],
      imageUrl: json['image'] ??
          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80',
      speciality: json['speciality'] ?? 'general',
      id: json['uId'],
    );
  }
}
