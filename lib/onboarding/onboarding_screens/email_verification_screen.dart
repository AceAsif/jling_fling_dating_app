import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jling_fling_dating/onboarding/widgets/custom_button.dart';
import 'package:jling_fling_dating/onboarding/widgets/custom_text_field.dart';
import 'package:jling_fling_dating/onboarding/widgets/custom_text_header.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';


class EmailVerification extends StatelessWidget {
  final TabController tabController;

  const EmailVerification({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            CustomTextHeader(
                tabController: tabController,
                text: 'Did You Get Your Verification Code?'),
            CustomTextField(
              tabController: tabController,
              text: 'ENTER YOUR CODE',),
          ],
        ),
        Column(
          children: [
            StepProgressIndicator(
              totalSteps: 6,
              currentStep: 2,
              selectedColor: Theme.of(context).primaryColor,
              unselectedColor: Theme.of(context).backgroundColor,
            ),
            SizedBox(height: 10,),
            CustomButton(tabController: tabController, text: 'NEXT STEP'),
          ],
        ),
      ],
    ),
    );
  }
}