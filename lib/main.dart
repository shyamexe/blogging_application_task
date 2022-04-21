import 'package:blogging_application/logic/post_content_cubit/post_content_cubit.dart';
import 'package:blogging_application/logic/status_indux_cubit/status_index_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/constants/strings.dart';
import 'core/themes/app_theme.dart';
import 'presentation/router/app_router.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => StatusIndexCubit(),
        ),
        BlocProvider(
          create: (context) => PostContentCubit(),
        ),
      ],
      child: MaterialApp(
        title: Strings.appTitle,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRouter.onboarding,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
