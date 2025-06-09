import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/foundation.dart' show debugPrint;
import 'package:local_telephone_dairy/features/auth/application/sign_up/auth_state.dart';
import 'package:local_telephone_dairy/features/auth/domain/signup_model.dart';
import 'package:local_telephone_dairy/features/auth/infrastructure/auth_repositary.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepo;

  AuthCubit(this.authRepo) : super(AuthInitial());

  Future<void> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String location,
    required String password,
    required String repassword,
    required String phoneNumber, // Added phoneNumber parameter
  }) async {
    emit(AuthLoading());
    try {
      debugPrint('Attempting to sign up with email: $email');
      final signUpModel = SignUpModel(
        id: '',
        name: name,
        email: email,
        location: location,
        password: password,
        repassword: repassword,
        phoneNumber: phoneNumber, // Pass phoneNumber to SignUpModel
        admin: false,
      );

      await authRepo.createUserWithEmailAndPassword(signUpModel);
      emit(AuthLoaded());
      debugPrint('User signed up successfully');
    } catch (e) {
      debugPrint('Error signing up: $e');
      emit(AuthError(e.toString()));
    }
  }
}
