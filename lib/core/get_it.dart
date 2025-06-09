import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:local_telephone_dairy/features/auth/application/login_cubit/login_cubit.dart';
import 'package:local_telephone_dairy/features/auth/application/sign_up/auth_cubit.dart';
import 'package:local_telephone_dairy/features/auth/infrastructure/auth_repositary.dart';
import 'package:local_telephone_dairy/features/contact/application/cubit/contact_cubit.dart';
import 'package:local_telephone_dairy/features/contact/infrastructure/contact_repositary.dart';
import 'package:local_telephone_dairy/features/profile/application/cubit/profile_cubit_cubit.dart';
import 'package:local_telephone_dairy/features/profile/infrastructure/profile_repositary.dart';

final getIt = GetIt.instance;

Future<void> setupLocators() async {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  //registering repositary
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo());
  getIt.registerLazySingleton<ContactRepository>(() => ContactRepository());

  //resgistering cubit
  getIt.registerFactory(() => AuthCubit(getIt<AuthRepository>()));
  getIt.registerLazySingleton(
      () => ContactCubit(contactRepository: getIt<ContactRepository>()));

  getIt.registerFactory(() =>
      LoginCubit(getIt<AuthRepository>(), firebaseAuth, firebaseFirestore));

  getIt.registerFactory(
      () => ProfileCubit(getIt<ProfileRepo>())..fetchUserProfile());
}
