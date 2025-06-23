import 'package:go_router/go_router.dart';
import 'package:travel/Navigation/bottomnavigation/bottom_navigation.dart';

import '../../Homepage/view/screen/home_page.dart';
import '../../serachpage/view/screen/search.dart' show Search;
import '../../userprofilepage/view/screen/profile.dart' show user_profile;

final approuter = GoRouter(initialLocation: '/home', routes: [
  StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          Bottomnavigator(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomePage(),
          )
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/search',
            builder: (context, state) => const Search(),
          )
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/userprofile',
            builder: (context, state) => const user_profile(),
          )
        ])
      ])
  // Home

  // ShellRoute(
  //   builder: (context, state, child) => Bottomnavigator(child: child) ,
  //   routes: [

  //   ]

  // )
]);
