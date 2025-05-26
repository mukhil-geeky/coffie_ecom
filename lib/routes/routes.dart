import 'package:coffie_ecom/application/order_bloc/order_bloc_bloc.dart';
import 'package:coffie_ecom/presentation/order_screen/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/onboarding_screen/onboarding_screen.dart';

abstract class AppRouter {
  static Route<dynamic> getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case OnboardingScreen.routeName:
        return MaterialPageRoute(
          builder: (context) {
            return OnboardingScreen();
          },
        );
    }
    switch (settings.name) {
      case OrderScreen.routeName:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => OrderBlocBloc(),
              child: OrderScreen(),
            );
          },
        );
    }
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: const Text(
            'Replace with page not found',
          ),
        ),
      ),
    );
  }
}
