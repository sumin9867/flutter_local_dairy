import 'package:equatable/equatable.dart';
import 'package:local_telephone_dairy/features/contact/entities/contact_entities.dart';


enum ContactStatus { initial, loading, success, error }

class ContactState extends Equatable {
  final List<ContactEntities> contacts;
  final ContactStatus status;
  final String? errorMessage;

  const ContactState({
    required this.contacts,
    required this.status,
    this.errorMessage,
  });

  
  factory ContactState.initial() {
    return const ContactState(
      contacts: [],
      status: ContactStatus.initial,
    );
  }

  
  ContactState copyWith({
    List<ContactEntities>? contacts,
    ContactStatus? status,
    String? errorMessage,
  }) {
    return ContactState(
      contacts: contacts ?? this.contacts,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [contacts, status, errorMessage];
}
