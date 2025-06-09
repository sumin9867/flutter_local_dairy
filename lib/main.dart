import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_telephone_dairy/core/get_it.dart';
import 'package:local_telephone_dairy/core/presentation/app_router.dart';
import 'package:local_telephone_dairy/core/theme/app_theme.dart';
import 'package:local_telephone_dairy/features/auth/application/login_cubit/login_cubit.dart';
import 'package:local_telephone_dairy/features/auth/application/sign_up/auth_cubit.dart';
import 'package:local_telephone_dairy/features/contact/application/cubit/contact_cubit.dart';
import 'package:local_telephone_dairy/features/profile/application/cubit/profile_cubit_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await setupLocators();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter(authCubit: getIt<AuthCubit>());

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<LoginCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<ProfileCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<ContactCubit>()..getContact(),
        ),
      ],
      child: MaterialApp.router(
        theme: AppTheme.theme(context),
        routerConfig: appRouter.router,
      ),
    );
  }
}
