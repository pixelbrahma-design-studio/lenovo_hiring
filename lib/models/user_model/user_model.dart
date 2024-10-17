import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String? uid;
  String name;
  String email;
  String collegeName;
  int contactNumber;
  String degree;
  String courseName;
  dynamic? createdAt;
  String yearOfGraduation;
  String gender;
  bool iAgree;
  bool acceptPrivacyPolicy;
  bool understoodRules;
  String role;
  UserModel({
    this.uid,
    required this.name,
    required this.email,
    required this.collegeName,
    required this.contactNumber,
    required this.degree,
    required this.courseName,
    this.createdAt,
    required this.yearOfGraduation,
    required this.gender,
    required this.iAgree,
    required this.acceptPrivacyPolicy,
    required this.understoodRules,
    required this.role,
  });

  UserModel copyWith({
    String? uid,
    String? name,
    String? email,
    String? collegeName,
    int? contactNumber,
    String? degree,
    String? courseName,
    dynamic? createdAt,
    String? yearOfGraduation,
    String? gender,
    bool? iAgree,
    bool? acceptPrivacyPolicy,
    bool? understoodRules,
    String? role,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      collegeName: collegeName ?? this.collegeName,
      contactNumber: contactNumber ?? this.contactNumber,
      degree: degree ?? this.degree,
      courseName: courseName ?? this.courseName,
      createdAt: createdAt ?? this.createdAt,
      yearOfGraduation: yearOfGraduation ?? this.yearOfGraduation,
      gender: gender ?? this.gender,
      iAgree: iAgree ?? this.iAgree,
      acceptPrivacyPolicy: acceptPrivacyPolicy ?? this.acceptPrivacyPolicy,
      understoodRules: understoodRules ?? this.understoodRules,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'email': email,
      'collegeName': collegeName,
      'contactNumber': contactNumber,
      'degree': degree,
      'courseName': courseName,
      'createdAt': createdAt,
      'yearOfGraduation': yearOfGraduation,
      'gender': gender,
      'iAgree': iAgree,
      'acceptPrivacyPolicy': acceptPrivacyPolicy,
      'understoodRules': understoodRules,
      'role': role,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] != null ? map['uid'] as String : null,
      name: map['name'] as String,
      email: map['email'] as String,
      collegeName: map['collegeName'] as String,
      contactNumber: map['contactNumber'] as int,
      degree: map['degree'] as String,
      courseName: map['courseName'] as String,
      createdAt: map['createdAt'] as dynamic,
      yearOfGraduation: map['yearOfGraduation'] as String,
      gender: map['gender'] as String,
      iAgree: map['iAgree'] as bool,
      acceptPrivacyPolicy: map['acceptPrivacyPolicy'] as bool,
      understoodRules: map['understoodRules'] as bool,
      role: map['role'] as String,
    );
  }
}
