import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jling_fling_dating/onboarding/widgets/custom_button.dart';
import 'package:jling_fling_dating/onboarding/widgets/custom_text_container.dart';
import 'package:jling_fling_dating/onboarding/widgets/custom_text_field.dart';
import 'package:jling_fling_dating/onboarding/widgets/custom_text_header.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';


class Biography extends StatelessWidget {
  final TabController tabController;

  const Biography({
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
              CustomTextHeader(
                  tabController: tabController,
                  text: 'Describe Yourself a Bit'),
              CustomTextField(
                tabController: tabController,
                text: 'ENTER YOUR BIO',),
              SizedBox(height: 100),
              CustomTextHeader(
                  tabController: tabController,
                  text: 'What Do You Like?'),
              Row(
                children: [
                  CustomTextContainer(
                      tabController: tabController, text: 'MUSIC'),
                  CustomTextContainer(
                      tabController: tabController, text: 'ECONOMICS'),
                  CustomTextContainer(
                      tabController: tabController, text: 'ART'),
                  CustomTextContainer(
                      tabController: tabController, text: 'POLITICS'),
                ],
              ),
              Row(
                children: [
                  CustomTextContainer(
                      tabController: tabController, text: 'NATURE'),
                  CustomTextContainer(
                      tabController: tabController, text: 'HIKING'),
                  CustomTextContainer(
                      tabController: tabController, text: 'FOOTBALL'),
                  CustomTextContainer(
                      tabController: tabController, text: 'MOVIES'),
                ],
              ),
            ],
          ),
          Column(
            children: [
              StepProgressIndicator(
                totalSteps: 6,
                currentStep: 5,
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
