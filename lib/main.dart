//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_api/view_model/cubits/cubit/news_cubit.dart';
import 'package:news_app_with_api/view_model/cubits/theme/theme_cubit.dart';

import 'view/screens/home_screen.dart';
import 'view_model/cubits/bloc_observer.dart';
import 'view_model/utils/thems/theme_dark.dart';
import 'view_model/utils/thems/theme_ligth.dart';

void main() {
    Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => NewsCubit()..callApiRequest(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context,state){
          ThemeCubit cubit = ThemeCubit.get(context);
          return MaterialApp(
        theme: themeLigth,
        darkTheme: themeDark,
        themeMode:cubit.isDark ?  ThemeMode.dark : ThemeMode.light,
        debugShowCheckedModeBanner: false,
       title: 'News App',
        home: const HomeScreen(),

      );
        }
      
      ,)
    );
  }
}
