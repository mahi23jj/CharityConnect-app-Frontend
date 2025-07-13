import 'package:go_router/go_router.dart';
import 'package:travel/Campain/view/screen/CampainListPage.dart';
import 'package:travel/Campain/view/screen/Donationdetail.dart';
import 'package:travel/Charity/view/Screen/Charitydetail.dart';
import 'package:travel/Event/view/screen/upcoming_event.dart';
import 'package:travel/Navigation/bottomnavigation/bottom_navigation.dart';

import '../../Homepage/view/screen/home_page.dart';
import '../../serachpage/view/screen/search.dart' show Search;
import '../../userprofilepage/view/screen/profile.dart' show user_profile;

final approuter = GoRouter(initialLocation: '/home', routes: [

   GoRoute(
            path: '/DonationDetails',
            builder: (context, state) => DonationDetail(),
          ),
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
            builder: (context, state) => const UpcomingEvent(),
          )
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/Donation',
            builder: (context, state) => CampaignListPage(),
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
