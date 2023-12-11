import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onlinica/modules/login/login_screen.dart';
import 'package:onlinica/modules/welcome/welcome_screen.dart';
import '../../modules/login/registration_screen.dart';
import '../../modules/welcome/after_wellcome_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      name: '/',
      path: '/',
      builder: (context, state) => WelcomeScreen(),
    ),
    GoRoute(
        name: '/s',
        path: '/Center',
        builder: (context, state) {
          return Container();
        }, ),
    GoRoute(
        name: 'AfterWelcomeScreen',
        path: '/AfterWelcomeScreen',
        builder: (BuildContext context, GoRouterState state) {
          return AfterWelcomeScreen();
        },
        routes: [
          GoRoute(
            name: 'LoginScreen',
            path: 'LoginScreen',
            builder: (context, state) {
              return LoginScreen();
            },
          ),
          GoRoute(
            name: 'RegisTrationScreen',
            path: 'RegisTrationScreen',
            builder: (context, state) {
              return const RegisTrationScreen();
            },
          ),
        ]),
  ],
);
