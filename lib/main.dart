import 'package:flutter/material.dart';
import 'package:flutter_application_19/controller/home/bloc/home_bloc.dart';
import 'package:flutter_application_19/controller/items/bloc/items_bloc.dart';
import 'package:flutter_application_19/controller/loginScreen/bloc/login_bloc.dart';
import 'package:flutter_application_19/view/BottomNav/BottomNav.dart';
import 'package:flutter_application_19/view/home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => ItemsBloc(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (p0, p1, p2) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
        ),
        home: Bottomnav(),
      ),
    );
  }
}
