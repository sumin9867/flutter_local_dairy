import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:local_telephone_dairy/core/presentation/scaffold_with_bottom_navbar.dart';
import 'package:local_telephone_dairy/features/auth/application/sign_up/auth_cubit.dart';
import 'package:local_telephone_dairy/features/auth/application/sign_up/auth_state.dart';
import 'package:local_telephone_dairy/features/auth/presentation/login/sign_in_form.dart';
import 'package:local_telephone_dairy/features/auth/presentation/sign_up/sign_up_form.dart';
import 'package:local_telephone_dairy/features/contact/presentation/add_contact_screen.dart';
import 'package:local_telephone_dairy/features/home/presentation/home_screen.dart';
import 'package:local_telephone_dairy/features/updates/presentation/news_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();


class AppRoutes {
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String profile = '/profile';
  static const String contact = '/contact';
  static const String addContact = '/add_contact';
  static const String bottomNav = '/bottomNav';
  static const String homeScreen = '/homeScreen';


  static const String updates = '/updates';

}

class AppRouter {
  final AuthCubit authCubit;

  AppRouter({required this.authCubit});

 late final GoRouter _router = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.bottomNav,
  refreshListenable: GoRouterRefreshStream(authCubit.stream),
  routes: [
    GoRoute(
      path: AppRoutes.signIn,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const SignInForm(),
    ),
        GoRoute(
      path: AppRoutes.bottomNav,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) =>  const ScaffoldWithBottomNavbar(child: Text("data"),),
    ),
    GoRoute(
      path: AppRoutes.signUp,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const SignUpForm(),
    ),
    GoRoute(
      path: AppRoutes.addContact,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const AddContactScreen(),
    ),
    GoRoute(
      path: AppRoutes.updates,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const NewsScreen(),
    ),
     GoRoute(
      path: AppRoutes.homeScreen,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const HomeScreen(),
    ),
   
  ],
  redirect: (context, state) {
    final location = state.matchedLocation;
    final AuthState authState = authCubit.state;

    if (authState is AuthInitial || authState is AuthLoading) {
      return null;
    }

    final bool isAuthenticated = authState is AuthAuthenticated;
    const unprotectedRoutes = [AppRoutes.signIn, AppRoutes.signUp];

    if (!isAuthenticated && !unprotectedRoutes.contains(location)) {
      return AppRoutes.signIn;
    }

    if (isAuthenticated && unprotectedRoutes.contains(location)) {
      return AppRoutes.bottomNav;
    }

    return null;
  },
);


  GoRouter get router => _router;
}

/// Notifier to refresh the GoRouter when auth state changes
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (_) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
