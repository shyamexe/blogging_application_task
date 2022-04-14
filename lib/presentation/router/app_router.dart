import 'package:blogging_application/logic/onboading_page_cubit/onboarding_page_cubit.dart';
import 'package:blogging_application/logic/status_indux_cubit/status_index_cubit.dart';
import 'package:blogging_application/logic/status_timer_cubit/status_timer_cubit.dart';
import 'package:blogging_application/presentation/screens/login_screen/login_screen.dart';
import 'package:blogging_application/presentation/screens/onboarding_screen/onboarding_screen.dart';
import 'package:blogging_application/presentation/screens/story_view_screen/story_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/exceptions/route_exception.dart';
import '../../logic/navigation_bar_cubit/navigation_bar_cubit.dart';
import '../screens/home_screen/home_screen.dart';

class AppRouter {
  static const String home = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String status = '/status';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
                  BlocProvider(create: (context) => NavigationBarCubit()),
                  BlocProvider(create: (context) => StatusIndexCubit())
                ], child: CommonScreen()));

      case onboarding:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider(create: (context) => OnboardingPageCubit()),
                  
                ], child: OnboardingScreen()));

      case login:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider(create: (context) => StatusTimerCubit(statusIndexCubit: context.read<StatusIndexCubit>())),
                  BlocProvider.value(value: context.read<StatusIndexCubit>() )
                ], child: LogInScreen()));

      case status:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider(create: (context) => StatusTimerCubit(statusIndexCubit: context.read<StatusIndexCubit>())),
                  BlocProvider.value(value: context.read<StatusIndexCubit>() )
                ], child: StoryViewScreen()));

      default:
        throw const RouteException('Route not found!');
    }
  }
}
