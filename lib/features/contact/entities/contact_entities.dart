import 'package:equatable/equatable.dart';

class ContactEntities extends Equatable {


  final String name;
  final String? email;
  final String phoneNumber;
  final String? address;
  final String? tole;
  final String? occupation;
  final String? gender;
  final String? citizenshipNumber;

  const ContactEntities({required this.name,  this.email, required this.phoneNumber,  this.address,  this.tole,  this.occupation,  this.gender,  this.citizenshipNumber,});
  
  @override
  List<Object?> get props => [name,email,phoneNumber,address,tole,occupation,gender,citizenshipNumber];






}