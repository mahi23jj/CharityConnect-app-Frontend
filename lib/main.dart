import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/Charity/Viewmodel/Bloc/charitybloc.dart';
import 'package:travel/Event/viewmodel/Bloc/eventBloc.dart';
import 'package:travel/Event/viewmodel/Event/eventsevent.dart';
import 'package:travel/Event/viewmodel/repository/Eventrepo.dart';
import 'package:travel/Homepage/viewmode/Bloc/homebloc.dart';
import 'package:travel/Homepage/viewmode/Event/homeevent.dart';
import 'package:travel/Homepage/viewmode/repository/home_repository.dart';
import 'package:travel/Navigation/router/approuter.dart';
import 'package:travel/autentication/login.dart';
import 'package:travel/autentication/signup.dart';
import 'package:travel/Homepage/view/screen/home_page.dart';
import 'package:travel/userprofilepage/viewmodel/profileprovider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CommentProvider(content_repository())..add(Loadcontent()),
        ),
        BlocProvider(create: (context) => CharityBloc()),
        BlocProvider(
          create: (context) => Eventbloc(Eventrepo())..add(GetEvents()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: approuter,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: sign()
      ),
    );
  }
}
