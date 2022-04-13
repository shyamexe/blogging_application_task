import 'package:blogging_application/logic/status_indux_cubit/status_index_cubit.dart';
import 'package:blogging_application/logic/status_timer_cubit/status_timer_cubit.dart';
import 'package:blogging_application/presentation/screens/story_view_screen/story_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/exceptions/route_exception.dart';
import '../../logic/navigation_bar_cubit/navigation_bar_cubit.dart';
import '../screens/home_screen/home_screen.dart';

class AppRouter {
  static const String home = '/';
  static const String status = '/status';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
                  BlocProvider(create: (context) => NavigationBarCubit())
                ], child: CommonScreen()));
      case status:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
                  BlocProvider(create: (context) => StatusTimerCubit()),
                  BlocProvider(create: (context) => StatusIndexCubit()),
                ], child: StoryViewScreen()));

      default:
        throw const RouteException('Route not found!');
    }
  }
}
