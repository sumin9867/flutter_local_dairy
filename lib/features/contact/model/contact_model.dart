import 'package:local_telephone_dairy/features/contact/entities/contact_entities.dart';

class ContactModel extends ContactEntities {
  const ContactModel({
    required super.name,
    required super.phoneNumber,
    super.address,
    super.citizenshipNumber,
    super.email,
    super.gender,
    super.occupation,
    super.tole,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      name: json['name'] ?? 'unknown', 
      phoneNumber: json['phone_number'] ?? '+977 ***********', 
      address: json['address'], 
      citizenshipNumber: json['citizenship_number'],
      email: json['email'],
      gender: json['gender'],
      occupation: json['occupation'],
      tole: json['tole'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone_number': phoneNumber,
      'address': address,
      'citizenship_number': citizenshipNumber,
      'email': email,
      'gender': gender,
      'occupation': occupation,
      'tole': tole,
    };
  }
}
