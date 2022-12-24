import 'package:flutter/material.dart';
import 'package:jling_fling_dating/onboarding/onboarding_screens/bio_screen.dart';
import 'package:jling_fling_dating/onboarding/onboarding_screens/demo_screen.dart';
import 'package:jling_fling_dating/onboarding/onboarding_screens/email_verification_screen.dart';
import 'package:jling_fling_dating/onboarding/onboarding_screens/pictures_screen.dart';
import 'package:jling_fling_dating/onboarding/onboarding_screens/start_screen.dart';
import 'package:jling_fling_dating/widgets/custom_appbar.dart';

import 'onboarding_screens/email_screen.dart';

//Onboarding screen is the initial pages that the user will see when they first use the app and make their user profile.
class OnboardingScreen extends StatelessWidget {
  static const String routeName = '/onboarding';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => OnboardingScreen(),
    );
  }

  static const List<Tab> tabs = <Tab>[
    Tab(text: 'Start'),
    Tab(text: 'Email'),
    Tab(text: 'Email Verification'),
    Tab(text: 'Demographics'),
    Tab(text: 'Pictures'),
    Tab(text: 'Biography'),
    //Tab(text: 'Location')
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {}
        });
        return Scaffold(
          appBar: CustomAppBar(
            title: 'Jling_fling',
            hasActions: false,
          ),
          body: TabBarView(
            children: [
              Start(tabController: tabController),
              Email(tabController: tabController),
              EmailVerification(tabController: tabController),
              Demographics(tabController: tabController),
              Pictures(tabController: tabController),
              Biography(tabController: tabController),
              //Location(tabController: tabController),
            ],
          ),
        );
      }),
    );
  }
}
