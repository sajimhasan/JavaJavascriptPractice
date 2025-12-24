// lib/models/user_model.dart

class UserModel {
  final int id;
  final DateTime? localDateTime;
  final String? contact;
  final String fullName;
  final String password;
  final String username;
  final String? city;
  final String? country;
  final String? moreDetails;
  final String? subDistrict;
  final String? village;
  final String? unionName;
  final int? postCode;
  final String? usersUnion;

  UserModel({
    required this.id,
    this.localDateTime,
    this.contact,
    required this.fullName,
    required this.password,
    required this.username,
    this.city,
    this.country,
    this.moreDetails,
    this.subDistrict,
    this.village,
    this.unionName,
    this.postCode,
    this.usersUnion,
  });

  // Factory constructor to create a UserModel from JSON / Map
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      localDateTime: json['local_date_time'] != null
          ? DateTime.parse(json['local_date_time'])
          : null,
      contact: json['contact'],
      fullName: json['full_name'] ?? '',
      password: json['password'] ?? '',
      username: json['username'] ?? '',
      city: json['city'],
      country: json['cuntry'],
      moreDetails: json['more_details'],
      subDistrict: json['sub_district'],
      village: json['village'],
      unionName: json['union'],
      postCode: json['post_code'] != null
          ? int.tryParse(json['post_code'].toString())
          : null,
      usersUnion: json['users_union'],
    );
  }

  // Convert UserModel to JSON (for sending updates)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'local_date_time': localDateTime?.toIso8601String(),
      'contact': contact,
      'full_name': fullName,
      'password': password,
      'username': username,
      'city': city,
      'cuntry': country,
      'more_details': moreDetails,
      'sub_district': subDistrict,
      'village': village,
      'union': unionName,
      'post_code': postCode,
      'users_union': usersUnion,
    };
  }
}