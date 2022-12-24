import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jling_fling_dating/onboarding/widgets/custom_button.dart';
import 'package:jling_fling_dating/onboarding/widgets/custom_checkbox.dart';
import 'package:jling_fling_dating/onboarding/widgets/custom_text_field.dart';
import 'package:jling_fling_dating/onboarding/widgets/custom_text_header.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';


class Demographics extends StatelessWidget {
  final TabController tabController;

  const Demographics({
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextHeader(tabController: tabController,
                  text: 'What\'s Your Gender?'),
              const SizedBox(height: 10), //This helps to give space between the question and the option.
              CustomCheckbox(tabController: tabController, text: 'MALE'),
              CustomCheckbox(tabController: tabController, text: 'FEMALE'),
              const SizedBox(height: 100), //This helps to give space between the gender and age question.

              CustomTextHeader(tabController: tabController,
                  text: 'What\'s Your Age?'),
              CustomTextField(tabController: tabController, text: 'ENTER YOUR AGE',),
            ],
          ),
          Column(
            children: [
              StepProgressIndicator(
                totalSteps: 6,
                currentStep: 3,
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