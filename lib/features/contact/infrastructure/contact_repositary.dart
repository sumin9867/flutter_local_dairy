import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:local_telephone_dairy/features/contact/model/contact_model.dart';

class ContactRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addContact(ContactModel contact) async {
    try {
      await _firestore.collection('contact').add(contact.toJson());
      log('Contact added successfully: ${contact.name}');
    } catch (e) {
      log('Failed to add contact: $e');
    }
  }

  Future<List<ContactModel>> getAllContacts() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('contact').get();
      if (querySnapshot.docs.isNotEmpty) {
        List<ContactModel> contacts = querySnapshot.docs.map((doc) {
          return ContactModel.fromJson(doc.data() as Map<String, dynamic>);
        }).toList();
        return contacts;
      } else {
        return [];
      }
    } catch (e) {
      log('Error fetching contacts: $e');
      return [];
    }
  }

  Future<ContactModel?> findContactByPhoneNumber(String name) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('contacts')
          .where('name', isEqualTo: name)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return ContactModel.fromJson(
            querySnapshot.docs.first.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      log('Error finding contact: $e');
      return null;
    }
  }

  Future<void> deleteContact(String phoneNumber) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('contacts')
          .where('phoneNumber', isEqualTo: phoneNumber)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        await _firestore
            .collection('contacts')
            .doc(querySnapshot.docs.first.id)
            .delete();
        log('Contact deleted successfully.');
      } else {
        log('Contact not found.');
      }
    } catch (e) {
      log('Error deleting contact: $e');
    }
  }
}
