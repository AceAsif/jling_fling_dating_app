import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jling_fling_dating/onboarding/widgets/custom_button.dart';
import 'package:jling_fling_dating/onboarding/widgets/widget.dart';


class Email extends StatelessWidget {
  final TabController tabController;


  const Email({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              CustomTextHeader(tabController: tabController,
                  text: 'What\'s Your Email Address?'),
              CustomTextField(tabController: tabController, text: 'ENTER YOUR EMAIL',),
            ],
          ),
          CustomButton(tabController: tabController, text: 'NEXT STEP')
        ],
      ),
    );
  }
}