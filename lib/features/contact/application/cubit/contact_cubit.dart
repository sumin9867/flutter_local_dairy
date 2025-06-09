import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_telephone_dairy/features/contact/application/cubit/contact_state.dart';
import 'package:local_telephone_dairy/features/contact/entities/contact_entities.dart';
import 'package:local_telephone_dairy/features/contact/infrastructure/contact_repositary.dart';
import 'package:local_telephone_dairy/features/contact/model/contact_model.dart';

class ContactCubit extends Cubit<ContactState> {
  final ContactRepository _contactRepository;

  ContactCubit({required ContactRepository contactRepository})
      : _contactRepository = contactRepository,
        super(ContactState.initial());

  Future<void> addContact(ContactEntities contactEntities) async {
    emit(state.copyWith(status: ContactStatus.loading));

    try {
      final contactModel = ContactModel(
        name: contactEntities.name,
        phoneNumber: contactEntities.phoneNumber,
        address: contactEntities.address,
        citizenshipNumber: contactEntities.citizenshipNumber,
        email: contactEntities.email,
        gender: contactEntities.gender,
        occupation: contactEntities.occupation,
        tole: contactEntities.tole,
      );

      await _contactRepository.addContact(contactModel);

      emit(state.copyWith(status: ContactStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: ContactStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<List<ContactEntities>> getContact() async {
    emit(state.copyWith(status: ContactStatus.loading));

    try {
      final response = await _contactRepository.getAllContacts();

      if (response.isNotEmpty) {
        emit(state.copyWith(
          status: ContactStatus.success,
          contacts: response,
        ));

        return response;
      } else {
        emit(state.copyWith(
          status: ContactStatus.error,
          errorMessage: "Sorry, There is no data available.",
        ));
        return [];
      }
    } catch (e) {
      emit(state.copyWith(
        status: ContactStatus.error,
        errorMessage: e.toString(),
      ));

      return [];
    }
  }
}
